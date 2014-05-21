### 2. You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party.

invitations:
* party_id
* invitee_id
```
class Invitation < ActiveRecord::Base
  belongs_to :party, :class_name => "Party"
  belongs_to :invitee, :class_name => "User"
```
users: 
* id
* (other administrative stuff, e.g. email, password, name)
```
class User < ActiveRecord::Base
  has_many :created_parties, :foreign_key => "creator_id", :class_name => "Party"

  has_many :invitations
  has_many :invited_parties, through => :invitations, :source => :party
```
parties:
* id (PK)
* creator_id (FK)
* (other administrative stuff)
```
class Party < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  has_many :invitations
  has_many :invitees, through => :invitations
```

### 3. Extra credit (tricky): You and your friends just love posting things and following each other. How would you set up the models so a user can follow another user?

users
```
class User < ActiveRecord::Base
  has_many :connections

  has_many :followers, through => :connections
  has_many :following, through => :connections
```

connections
* follower_id
* following_id
```
class Connection < ActiveRecord::Base
  belongs_to :follower, :class_name => "User"
  belongs_to :following, :class_name => "User"
```