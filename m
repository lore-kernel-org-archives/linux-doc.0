Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244359;
	b=mYZ8spMX08dIliElvGm1XlglVE2fSRNoG17OmQJtZGFnWCs4TH3G412Ti8HxjUrOUNbm
	 +1yAbhBHzCN+tTn4VFf1kyGdfSCv2X5CsQH49pXB+FdLXzktHk8bcyb1QBBAyQCbPEUTN
	 xWyZ52fhyOE6c87VTP1D3LBAdaItI5uVQuu7lfYeLXBsSeQhLNDo4qVV/a9iSEMjeGiNl
	 bM2QFtsoRw0wd4Y1b9lDIRlPI8WwSIukZU7kmpHJdRE9krveQmxgRq9omNWdLKNxzvakf
	 YsBdi95WYGsBi+Dl6V6KI9waaqEbZBVV7zG8yak1lzOJ9Ny5FIC5Vwv2NQLtqpSjmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
	b=3NY6Xfq+xEImPIG3tpZoFPn+MpC3p6LdNaM17ByWWt3k5pPwm1LFc2c4zbqaoUeGf7mX
	 1tOL5g857DKbAy8cvC/8XWD4uxmjNqxJv2qCmLMwPpVfdly0FzvBS8hz++ZSFFRaHuGuL
	 KiBZC3lL3VpfkBnuzMdBNqcNiNek4Zl3AdJU89jDGXyDUNXFUyauvtH9H/8tpWIEUE0w/
	 Oo/MZhxMaV19OQhJVMHiGiNUJF04jRZNdgyGKkXsDjt0SabzifnLqHkrCO78HdAC/VpFf
	 fy/uVD9rF5WzRmOtQDqIJBer+Qwsl9KLdMyq2f9pGNOG16BtEVAx2t4iLDbn2KfB7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yl4Em7oV;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62B606A326
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D62B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yl4Em7oV
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91e7fc8265aso13931696d6.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 09:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794244358; x=1794849158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=Yl4Em7oVwrZZg0i63RkmLtgR+ZRN9euPgyMkxxN1Ob152+zGGnL2fm2jvTYJo4LVnF
         vMEovACZqMWqSZBQO8MwjFgjN/VfTU1Hb0gUOSD50ReMsbb4x2PsB8Vqznx9hxIVJ9P/
         ktueRojchyU0OBQAvs4hpd+FT+5Nl5MGAaSYHa1Vg/86pPRlmOn28BDAbJB366nQmarU
         C7enZgKp8KEKbUHK1eQuucK6wGkqEYMXhjguAz7je3g8iMjLQyATGWC6+GeMkRPjj6b5
         YcfHQWnHrd67gsof5g39Wok+gfkBlOMw1fVpw6g/CmgVLoFrpX+x7ke/8IMcGiq6ZU6J
         xcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244358; x=1794849158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=Rm2kgO2ITrD286yR3occXvxYnzqMHm7GCR/YgVskw8klsubPHwDZlPgGJZmjIpHKMR
         9rrkFfHH2Y0bguWSdTcH7Ve0iTz8puPfDq4je8gVjYkDdn2DZbTaiIQb2kKQIgW+J4y1
         KFJ0u1bPjXrvZTAgUhtvjSLUEOdnL1lm1/KX9F5/T0yBU3T+hG+lYgDLn2hLhwPhV3Lm
         G/yx7laPVlIZulOXY4Zdq76QCqSzoB7euWYE4uqruYHQ+9+oKTzZNvFiuYk5EH6VT8lZ
         WPMjnpljEQAUWKQ8zZisc/guH2O09hujLvJAjfkByGZhKkHdDPMX9iRPftGA9iEr3Hd2
         rNfw==
X-Forwarded-Encrypted: i=1; AL+hErGS35ctzNfitk9qesb/KIKeAHewVfgm67ui9zTksQzp7Z3KIdYki1zRsaQToFf/6W08d7Cn6LbCzCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JHffwaVCMEZSnQEgLkUrJWOCEutqwkUqIPIEk/i9++kEwYNMa
	9QJ5PV82Vji7Oig2UvyMKsglL6VvNPGN1vzKhKrtazAioEfsmo7Pfqn3NcdU7EAmyrQ=
X-Gm-Gg: AYBFou3ivh7S0XWnRPE31JYV0arlrnPHfgZa931rju3Y8utrJeraBwZapYyBkJFSBPT
	Mm1FHiDcje06T8xlVY9V6jmSezJXomQ3RX2/oOD7RJ36FzEvD+ucDGeEy5QzuYYUHgUofiRqNty
	vK+mnwuNJhPBqBU1u2y9wD/aXz9hi+zgAmN0YenxUUmvDZWpEOwYCARZc7Gzg3Vh4EHBaKdItbf
	YMVZ4/ZmqzkdwCKwFCN8n03Z6jfy4l/efHlTfnDUgllF2f94pUzBk1ONYxU2PDKXBCZvIKzGeij
	nR4TCkNQnuo5df6MYte9u8KyAKMe1mwVH+uYaf80mH7fw9EDYYBGzT7uitb4XFwh5MgoXBmLtR+
	2vyQTk7sPvXqA3Euuesai7Gl+QQDZkMuhdRUXMIqiN4HE+qQAn4jEXy1Guad2drcWCb6NU2T0Vl
	cs7d+EaPqDBX/rquOU8xDzIGsKgjtg2B61J06Q7eEorzWhhSJc2SHoGnFnAVs+YpzYUJmkL4Lvw
	juloPKIYMo+AXOXPdkl+Gcv18fsTweinmYL5T00rAUcNpSSca2pwl7Hvayd79zFDQ5SxI3s0xm0
	4+bIP8jKtwm+D3Mb2bu6LmfbAyAZqOGtumhkrqeobRKKPno07MiEUl+ao3oR+AMThwVogY8oCPc
	fg6TNwJKATw==
X-Received: by 2002:a05:620a:4625:b0:946:26a:22c4 with SMTP id af79cd13be357-9479f415545mr8700585a.73.1794244358097;
        Mon, 09 Nov 2026 09:12:38 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm277806d6.41.2026.11.09.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:12:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQSv6-00000001ryf-1fz6;
	Mon, 09 Nov 2026 13:12:36 -0400
Date: Mon, 9 Nov 2026 13:12:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Fang <peter.fang@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261109171236.GP663069@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
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
In-Reply-To: <au5LCE1jau0yDo5S@intel.com>

On Fri, Nov 06, 2026 at 01:47:52PM -0800, Peter Fang wrote:

> For TDX, the direction so far has been to keep the guest as simple as
> possible in the attestation process. So the "quote type" knowledge is
> pushed into the TDX module and the remote verifier. The host kernel is
> mostly tasked with transporting the quote blob from the TDX module back
> to the guest. In other words, TDX doesn't have any quote type knowledge
> outside of the module itself. And as far as I know, parsing these blobs
> is sort of a pain.
> 
> The TDX DICE blobs are actually self-describing, meaning the verifier
> can follow a schema, parse the blob straight away, and know what's
> inside, including how to verify the signature. They're also
> distinguishable from the legacy quotes. A launched guest is guaranteed
> to have a stable format for its quotes. So this makes me wonder how the
> labeling should be done. Do you think it makes sense to just have a
> "primary raw TDX quote" label and let the TDX quote blob describe
> itself? Also, I think currently there are no plans to add
> secondary/supplementary blobs alongside the quote itself.

I would be very happy if Intel came with some plan, documented in the
ABI comments around their labels down the road.

What I would like is that given a specific label any userspace can do
a verification and full dump of that data, including signature
validation, without need of any further external information.

Ie it is entirely self describing under that label.

So if someone has to say externally 'oh this was a legacy VM' to make
parsing work then that needs to go in the label.

Think of it this way, you should be able to run a command, lets imagine:

$ attestctl dump report0
   intel TDX A:
     - Field 1
     - Field 2
   Signature VALID
   Certificate chain
      A
      B
      C

It must not be something like:

$ attestctl dump report0 --kind tdx_legacy
$ attestctl dump report0 --kind tdx_dice

Does it make sense?

Whatever labeling you choose has to follow these goals, and there is
some trade off between making thing self describing forever into the
future and exposing protocol details into the guest kernel driver.

The future scares me so I would always design to include a description
of the blob from TDX module to the guest driver :)

Jason
