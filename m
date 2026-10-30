Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354004;
	b=SU31Oi1aX9ECICfFiTAFsS52ddAK5YCfRPjft+NA0hi/MWSvpHDyZsBgXzZWEEwcMfsR
	 R4e/Zx6pHhWpbneHOj7/6KNXsddVMKseiyLNwegF7FatV1l8CbSoAox/Nf1lKCYIeN/N1
	 S7TgQl7ys2KIJnAEgR0Qkh5NKF2kfwneiQ1SX2/E/3Q9bvvrQYWX6fR5RGW2UwFFG2mii
	 7BQEubzFDBHqi2g446ZsRLIqC+K7cJnCZJ57cbcK9Kqdn+3NA7xvrw5s6nVfzMno/9jBo
	 +7m4JAg85l9rNF25dov5zCrzA6WqWFuxE1eSJyqS1WXT/D7w6D0aaTCNIijWpcUd0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
	b=qKT0WUqSQqxqpsDPvMsbD7Gh5B7ahDzJtF1eRnXq6C0Rn0Kt1pq5+Zdz61hl+wPQQxO4
	 Zacf2SHmajpvh8nXjGy1S+yTelbsVaG/znYnPBpm2AzEzX7HDNZSyaOcFXpT0M6TICYxI
	 XJA3iYVJ3Utt7coGzWWylPadyvP6xerBN+UJZxjJ4M1ZeP1nENvWzKi5B8x6JQQaRANBn
	 XSE4mExVbNfVudOm47M9xjlAh5NeKJGeuTY5r99kQF/c9A+DDzxvQ9b9tchuovIGWOq+8
	 sgMukVtU8DJG58XRPHVbpf42n4o3OmLnubz/+ZiGzctaRSu6vbWeJbRed2PpAGuuzYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=jfCUPK9s;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F8C60A2606
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 09:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F8C60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=jfCUPK9s
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5108195e9.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353997; x=1793958797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=jfCUPK9sZBoRtj2E+Alb9yXH9e9oEAKo6O5FdNMtEtjfbqrv2VRaYVXKp3gzMIsb45
         sd5OuL+bpBjiYZ5XwMFZwC4lARId+a+AiPW3kCH52zurleBtox0FUUeoLFox5UZbALIX
         iKhkw0WljBZZ7vq1pKhyJKVBXZVsAGRnFlj9YEJ71eTohu3oCRaJIaiPjZ+ONR0FrkN7
         9FWaY5PjdmumcBgOVAnQAZYOrvX2In4f41fMgf6TycYk0f0XDQq32zX+826jUXH5Tntc
         GM244THgeu1VuSeiZn0SWIzmXDYSOnmv4iLsdz10MK0iILCHIe5p/kNUpjENpypGm5IQ
         jgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353997; x=1793958797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=cX+k3qcx25ZcWV5cKYRBA6JHO4eeBHL+ux/gQU1JH16UjmtOJR5Eb08vrCzV+vVOIk
         wgv92pNps3DILTelB7t+cHPFny8cs+RTtlr2c3N1RbuEkAWDtOsFmekur6oV7w6c3k35
         sViwzWKMawlnn6kGiMwCF3/uliuNkeu0adK4VIkl/kqLy2gt2aPTw5Kgx7dCHQre2Eof
         19t/6SVPqPMq4Sd638Flhoa0SFag191k1YlAf5BPqZ87FhtLKfCA07+k2BM0DlX1eJ2q
         H2OYqdmpVHBDpHZDfS6GErGSk9V5Gr4r5iHMFJMwU9fyWwNbmtKblmWhaGwDNAEU6a6t
         NxEA==
X-Forwarded-Encrypted: i=1; AKwUvBxEf+vd1ykXTDp7lLEDMOjlVe3jVQE9yWuNJUvIujxvAxsRo2OwEl6R5zvL21VZKpDIZcwUH70V5ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc4XmIL6sAln23MEUkq0s2CsbXmVE0Abgxn//120G1KpUkCqKK
	L57SC1gMny9bS2JxcEpdpZMQzcxdEl8PEdp2/yD9sY6O1reNRN6ovFPbCoDmji8tWMM=
X-Gm-Gg: AYBFou3LxIGDPmDe513hlrtP5svmu6VG2YjA9v67/KIqu4kvDsApT2kNylI0gQHWE5Y
	wic1Ca8g+y+K2Lbj+Gw2q9z3ufm/zEip0MzjvNsyCU7Bl5KZ52wy9hMmZ/e0aNUKxFqGhKjlSsy
	udveE37uX+8henjeXJfcN7elHeaX6qD6uzhDuCD3VacjH+H/i/9jSZKPUYw1BKbeJePjIh3L0bX
	Sy9p6WRUppxrjdQbJqKiZ2ButB+gMJ6SrafASqKB5wAelyFMkBY3NIdiU5rIN1HoLKko7JMVrOQ
	ejAT6JgoEBLbwWR10KC++Nk7SzQQ89Y/t79vqGZmqlHI3URaWeJal99zZQKk2bg0TnOS486Rr0A
	x5TLTdjIOo0J7oX6BHyC/IAHhAXs64hU19CBZNmg4iO66bQXFbb78xeGd97ENaQDQlqQ0tqJke0
	2vUQMWQMmzzFxA+v1LYCk0O9ectBTQ5cnqt6PR63mkW10VjEgAtoKxrYzVP+raKWSzhF6036h8g
	LtLQNcqpEDsVzlLVKYyu1qa3+TAOfS3FKiMfBmB8MLWL+R0cavTBL3aE0zEIzTarOn8bQYpBCkb
	qvG98Xho+uYmTWq3c6PpojfIoRYFejztB9s7NwLX34sBI5XCDaa6bpGgywg=
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr37419475e9.32.1793353996568;
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm127578065e9.4.2026.10.30.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:53:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRmMPfaFINUIchi@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>This isn't even that complicated, if I ask AI to explain it in a C ish
>language:
>
>struct device_get_reply {
>	struct {
>		optional struct {
>			uint min_challenge_length;
>			uint max_challenge_length;
>			uint max_total_output_length;
>			struct {
>				enum blob_class;
>				string format;
>				enum representation;
>				uint max_length;
>			} objects[];
>		} evidence;
>
>		optional struct {
>			flags mr_flags; /* read, extend */
>		} mr;
>	} caps;
>
>	struct {
>		/* device-info: filled by the derived family */
>	} info;
>};
>
>I think the yaml names are not helping, calling everything attrs
>everywhere is really confusing. At least the transition into a nest
>and an attr-set should be more clearly marked in the yaml..
>
>The yaml would be significantly better if it was layed out according
>to the actual semantic flow instead of artificially being twisted into
>this need to put everything into a linear list. AI invented this:
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>        max-total-output-length: uint
>        objects[]:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>      mr?:
>        mr-flags: mr-device-caps
>    info:
>      $extend: device-info
>

I have it implemented like this (with small changes). Looks great!


>So.. how about could we drop the sets, use a direct description of the
>layout and do something else for the ID numbering? Maybe the numbering
>can be solved directly by only listing the names in:
>
>numbering:
>  - device-get.reply
>  - device-get.reply.caps
>  - device-get.caps.evidence
>  -[..]
>
>?

I'm still committed to implicit numbering. For "inline records" I
resolved it by having it encoded as a tree with 4 levels:

 63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
+-------------+-----+------------+------+------+------+------+------------------+
|   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
+-------------+-----+------------+------+------+------+------+------------------+
              |<------------------ record ------------------>|

Renamed "attr" to "field" - I agree that the original implementation had
attr everywhere. I got rid of it.
"group" is now "record". I enlarged it to 32 bits to accomodate:
1) kind is one of: named, request, reply - request and reply is used for
   inline op records,
2) index for named records (pre defined)
3) L1-L4 for inline records

rfc2 will show it in more details
>
>-- 
>Jason
