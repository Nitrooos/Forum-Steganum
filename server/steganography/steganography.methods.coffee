Meteor.methods
    getImagePublicKey: (image_id) ->
        image = Images.findOne({ _id: image_id })
        if image? && image.metadata?
            return image.metadata.public_key
        return undefined
    setImagePublicKey: () ->
        return [123, 456789, 4397856, 238761, 958652, 23985695, 9328798234, 498576,
                10575, 394875, 328457, 2756, 93285732890, 93863, 89457, 32987,
                45, 42395, 3285, 42398520, 428957, 2875, 43890709, 924875,
                9287529, 245876, 2498573, 43089767, 48957, 423958, 47356, 982472]
        publicKey = []
        for i in [0...31] by 1
            publicKey.push(Math.random()*4294967295)
        return publicKey
