Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659685;
	b=DpRwvtI2ruF3KM1AMuOJGoNYjw1NB+BWUXdwGL8WTzW/DNzo5xnsMM9x6DGTsgM4KTuK
	 8KZreOyWSQpJRXYKO6kIZq4bhl2Q60KzuLk+Zd4zv6pTYnmW1iCIoZMoj9K1LKNTyWqDh
	 Hv57Pu8QxeyuSBGL5vttppuCXyChIuGXfmib0sihxxdRWD8cVmO4fzd7C3pRZ6c5EQNpt
	 NFpQvCsCwdmY8knH2rkoc6eECCxEiZLlD+LXQQIijPBlTaC7lcVWHx5A4n3ROG+eOWj+d
	 C8bdlr4yVeWz/o5iRHP0DcOz/gYbquzfq9AeIdPgUdM5eZdFlDPPIlY+O3yZjGNJh0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1M91N4x2jkXM5IsJ1QyquMgQ5eQNEUvnCoLpXjporvk=;
	b=j87KaZdabHJBaQa0t7IJz5TnCijkElVpZUGjzr86qSFjXdIGa96sJ0dNPTETkioO9/QR
	 Lo4j9bFUb8IJRt6hAyq2qSQkvXyyUTy3kFc6nXuA8uBFNG/6xkj5ooslcPYNMlOAQyHx1
	 FXu23IPMAB3dZr0AsBZBGK+hQl5Xa2Z10OE2tL6xoIIKelkOgGDA3VRELnkZKQ0z+yiP7
	 nBafOayyr4A4YbsqVqos2EmUejw8J6JuMnjjUmmzaT8MW+X/ZByZyNQVhxLszgfOu1ysX
	 RW3wULZ3JtqMxrchGlRThDpEzr8YhxNub6Za8M2U5KRTwKT2dRKPgk/OqvEyWAKlltQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Xm48qF+c;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8AF606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Xm48qF+c
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df54150dfso1001758f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792659682; x=1793264482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1M91N4x2jkXM5IsJ1QyquMgQ5eQNEUvnCoLpXjporvk=;
        b=Xm48qF+cavnI98CF+FEn/aOxyHWgeA3QXlxnHWpH3APrUrU8fL5Hv7ngylFDNiVRFf
         KLRVlNPYWp5uQRbptpw7dmjARCTX6hyvPjudnH1BR9vJkURRrYYlYsQ4xIGz3EY4nmtx
         DNKCGAE6z/pV56Q1SmnhXJGfaqt3IIO14tP+14apQIkSbLbaI0Lc9wrxsBqDX4YZSZbo
         YAWQMfGUijXDz9xbZO0Hp5w2IX3uQnKAZOqRiKKnJcMMWeJUVV9CbO/7a9ZhwP8I3ntm
         v/lg6DzpLwRLx620WELZZ4owoq2j/v8lkWWZCgphvLuUOyAH4G/QMGpqypk/XZtDnUf9
         Ixxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659682; x=1793264482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1M91N4x2jkXM5IsJ1QyquMgQ5eQNEUvnCoLpXjporvk=;
        b=lv00j5+XV/ixf7YWuHdXsCzZgr9VE5AfYkeiOVdLzzFXbXz5GrPd1lXo6dDaU/et6x
         Qw2CfGbd+Ion2YDa3lPP2IjIYBG50QX3nZQvtkTSfzzvdaknGJYU5tCC4XfnXH0Gd57F
         r+l5LHEMuJoV92ZHWY9Jar69HF5KBH7ADclWj2VQ+zsqHkHora9+SpTpAfng5ocqYaJ7
         kNL2eQVqyV4le5tUqVPU+X4mvsyM69foiI1j7NKut91r/HhpTv/C1TYg2c1D2/k4At+9
         6kpCzb7B263xSRmPDqYMjUwN8OVz3GL+lzaZduPCD8+kdbNJS1M7KdOQ/EPB5V4GkFPM
         fDuQ==
X-Forwarded-Encrypted: i=1; AKwUvByTI6pN+Xz9uOK1GN1/1u3GijhdQKyvIQmlcVF5VgSEvMyETP01Yg2AvyKhLpMeTI9MNPkPVSvFGIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgYX05RunLxcCUdCNVnRHyF8GCxxH+61uk5xgWzURqZhPy2kGj
	+Ss3HdTKwB6zgbmf4JVpbQPN8UX/PRcII8odgt2usmqS3vKhDJX4lLALQn1CXijTbG0=
X-Gm-Gg: AYBFou119Q/V73Ba7B/WymWFJJZgg0+z3APIRt/8v7quFxjDf41Iq59e5o0AMgLn9+/
	n1r8Gf1KovY9OSI0zcwjZOwphGuDCop6BIFfZaTNUqTFgdDfycpgteD9tRZXEn+i2eRAHQKJG9G
	bclqAax/AxGoDHyloC1l7s7Hl/RKvKXxf/pBj2eVjZvdpTmssdOvq19Ryixd7kbBiuQyPjoFuIT
	DdCtVfxRSKgfw6lSYW+rllA3Tdm9gQBZWGxLhvBJX/aHNSiJCKSNfhfqbU13/R+G1sdmATu6tXT
	cu8ormekx121Ab+ca/qmj8j1VJXlQuWo4GQrZ7MORENRvRT8mm5bTHiinYo9Ev7Q2LoskuF0uSD
	oeomi27ov2mo7fcyx5XfFTiGJElTGnCIgnN/lb8nbcxOrkPqwgbMZZ+bmKULyk/1oTB208Ryhbv
	c77yDnALAbBSRJ5cxUjZU0FmWnCJC4lOjEpgAZ3Pci2UJoWjeVQYIKK7RbgRcfsm+gxzZrVf0Kc
	y6d9J6risHy5E5yfftlyA7PgObLun0RH6K/RkMTcScn3/7P/aqrI+5/IJG5ji3K
X-Received: by 2002:a05:6000:e46:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-48e26511828mr6746766f8f.55.1792659682008;
        Thu, 22 Oct 2026 02:01:22 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm11228550f8f.34.2026.10.22.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:01:21 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:01:17 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <atnJUfh0_Y3BRKx3@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
 <20261021011122.2cd96901@jic23-hlaptop>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021011122.2cd96901@jic23-hlaptop>

Wed, Oct 21, 2026 at 02:11:22AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:37 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Describe the CTLV transport, discovery, wire format and userspace
>> compatibility rules.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>In general looks good to me - this let me get my head around
>what was going on nicely (I think!).  A few trivial comments.
>> ---
>>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |   1 +
>>  MAINTAINERS                           |   1 +
>>  3 files changed, 509 insertions(+)
>>  create mode 100644 Documentation/userspace-api/ctlv.rst
>> 
>> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
>> new file mode 100644
>> index 000000000000..5ebca3d4d94a
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ctlv.rst
>
>> +Discovery
>> +---------
>> +
>> +Both uevents, addition and removal, carry the family chain as numbered
>> +properties::
>> +
>> +    CTLV_FAMILY=ctlv-accelerator-foo
>> +    CTLV_COMPATIBLE_0=ctlv
>> +    CTLV_COMPATIBLE_1=ctlv-accelerator
>> +    CTLV_COMPATIBLE_2=ctlv-accelerator-foo
>> +    CTLV_COMPATIBLE_N=3
>> +
>> +``CTLV_FAMILY`` is the family the device answers as, the numbered properties
>> +are its ancestry from the root to that family, and
>> +``CTLV_COMPATIBLE_N`` is how many there are. An index never moves: changing a
>> +family's parent is an ABI
>> +break, adding a descendant only appends.
>
>Odd line wrap.

Will fix.


>
>> +
>> +A program that wants every device, including ones appearing while it starts,
>> +must listen before it looks, which closes the window between enumerating and
>> +subscribing::
>
>> +A whole message with every offset, for a request of one integer and one nest
>> +carrying a string and a further nest::
>> +
>> +    offset  attribute                       len  flags   contents
>> +    ------  ------------------------------  ---  ------  ----------------
>> +         0  root                            120  NESTED  attr_id = 0
>> +        16  .. chunks                        24  -       8-byte integer
>> +        40  .. chunk                         80  NESTED
>> +        56     .. label                      19  -       "ab" and its NUL
>> +        80     .. item                       40  NESTED
>> +        96        .. value                   24  -       8-byte integer
>> +       120  end of message
>> +
>> +    +--------------------------------------------------------------+ 0
>> +    | root: len = 120, flags = NESTED, attr_id = 0                 |
>> +    +--------------------------------------------------------------+ 16
>
>Diagram wise, should chunks and chunk be shown nested inside root like your
>.. above is indicating?

Oh sure. Missed that.


>
>> +    | chunks: len = 24 | payload: 8 bytes                          |
>> +    +--------------------------------------------------------------+ 40
>> +    | chunk: len = 80, flags = NESTED                              |
>> +    |   +--------------------------------------------------------+ | 56
>> +    |   | label: len = 19 | payload: 'a' 'b' 0 | 5 bytes padding | |
>> +    |   +--------------------------------------------------------+ | 80
>> +    |   | item: len = 40, flags = NESTED                         | |
>> +    |   |   +--------------------------------------------------+ | | 96
>> +    |   |   | value: len = 24 | payload: 8 bytes               | | |
>> +    |   |   +--------------------------------------------------+ | | 120
>> +    +--------------------------------------------------------------+
>> +
>> +``label.len`` is 19: its header and three payload bytes, not the five bytes of
>> +padding after it. ``chunk`` counts those five, its ``len`` of 80 being its
>> +header plus ``CTLV_ALIGN(19)`` plus ``CTLV_ALIGN(40)``. A walk over a nest's
>> +children advances by ``CTLV_ALIGN(child.len)``, a walk of one payload by
>> +``child.len``.
>
>...
>
>> +
>> +Request occurrence order
>> +------------------------
>> +
>> +Occurrences of one attribute ID must be contiguous within each request root or
>> +nest. ``A A B`` is valid, while ``A B A`` is not. An ignored unknown attribute
>> +is not an occurrence of any known attribute, but it ends the preceding run, so
>
>An ignored unknown attribute, whilst not understood, ends the preceding run, so ..
>
>(or something like that to avoid saying unknown is not known ;))

True, this is already subject to reword anyway :)


>
>> +``A ignored-unknown A`` is also invalid. Different IDs otherwise have no
>> +required numeric or schema order.
>> +
>
>> +
>> +Executing an operation
>> +======================
>> +
>> +One ioctl executes every operation::
>> +
>> +    struct ctlv_op_exec {
>> +            __aligned_u64 op_id;
>> +            __aligned_u64 request;      /* struct ctlv_attr __user * */
>> +            __aligned_u64 reply;        /* struct ctlv_attr __user * */
>> +            __u32 request_len;
>> +            __u32 reply_len;
>> +            __aligned_u64 generation;   /* queries only */
>> +            __aligned_u64 cursor;       /* queries only */
>> +            __aligned_u64 reserved[2];  /* must be zero */
>> +    };
>> +
>> +    #define CTLV_IOC_OP_EXEC _IOWR(0xBB, 0x00, struct ctlv_op_exec)
>> +
>> +``request_len`` is how many bytes the kernel may read at ``request`` and
>> +``reply_len`` how many it may write at ``reply``. They are copy boundaries, not
>> +message lengths: a root's ``len`` may be shorter than ``request_len``, the
>> +bytes after it being ignored, and may not be longer. 
>
>I don't really mind this but why have this relaxed? Whatever sent this request
>just filled in the root len so why wouldn't it use the same value for this structure?

Yeah, I was thinking about having it relaxed or not. I did eventually go
with "why not". Makes userspace live perhaps a *bit* more easier having
one buffer and buffer_size for multiple op calls.


>
>
>>``reply_len`` is never
>> +overwritten; the length written is the reply root's ``len``. The pointers are
>> +fixed-width so a 32-bit and a 64-bit process pass the same structure, and in
>> +place of a size field the ioctl number encodes the size and ``reserved``, which
>> +must be zero, covers compatible growth.
>> +
>> +Every action and query carries a physical request root, including an empty
>> +request. ``request_len`` is therefore at least one attr header and at most the
>> +1 MiB transport limit.
>
>Why this particular limit?  Any thought to making that discoverable rather
>than fixed? (with a minimum to allow the operation for the length to be discovered).

OPS_DUMP exposes max size per op already. This limit serves different
purpose. It is a safeguard againt insane family yaml author. If he would
try to fit in ridiculously long binary attr, it would provide a clue to
use blob attr instead. I think that 1M is too big. I would perhaps go
with 64k initially. As it is kernel internal limit, could be changed in
any time. Makes sense?


>
>Maybe it is better to just have fixed size.  I wonder if ultimately we
>may end up with cases where the tlv is just passed on to firmware / device
>(because it is nice and convenient!) and having to split or marshall
>multiple messages would be a pain.

hmm. tlvs passed to device would work, you would just have to take care
of the blobs inside.


>
>> The ``request-max-len`` reported by ``ops-dump`` is the
>> +maximum request composed from the known schema; a newer caller may exceed it
>> +with well-formed unknown attrs marked ``IGNORE_IF_UNKNOWN``, up to the
>> +transport limit.
>
>> +
>> +Events
>> +======
>> +
>> +An event reaches a file description that asked for it, and only that one:
>> +
>> +1. subscribe with the ``subscriptions-add`` action, naming operation IDs;
>> +2. read records with ``read()``, one complete record per call;
>> +3. unsubscribe with ``subscriptions-remove``.
>> +
>> +``poll()`` reports readability when a record is queued. Each record is a
>> +header followed by exactly one root attribute::
>> +
>> +    struct ctlv_event_hdr {
>> +            __u32 length;             /* header + aligned root */
>> +            __u32 flags;              /* zero */
>> +            __aligned_u64 op_id;      /* the event op that produced it */
>> +            __aligned_u64 sequence;   /* per file description */
>> +    };
>> +
>> +One ``read()`` returns one record, the header and the aligned root::
>> +
>> +    +---------------------------------------------------------------+ 0
>> +    | length = 24 + CTLV_ALIGN(root.len)     | flags = 0            |
>> +    +---------------------------------------------------------------+ 8
>> +    | op_id: the event operation that produced this record          |
>> +    +---------------------------------------------------------------+ 16
>> +    | sequence: counted per file description                        |
>> +    +---------------------------------------------------------------+ 24
>> +    | root: len, flags = NESTED, attr_id = 0                        |
>> +    |   the event's attributes, exactly as a reply carries them      |
>
>stray space.

Will fix.


Thanks!


>
>> +    +---------------------------------------------------------------+ length
>
>
