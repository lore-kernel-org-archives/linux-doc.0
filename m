Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316278;
	b=pwrHn+LRx8eHD/D7HYfNjoZUp6FgZ38aTq+S9IMAvhRvP/4VS+ByGWIOwT1NmDr8hvjf
	 psUllB/FG0aCiWy5eesRHPmF/CiK71L3b1+YRnRR6Yo0xDHXBua9qoas/sDnswbhrCJGm
	 ryK6RGtMEt0MAhywAEREdhZDwMjvuNIvsndAmMOdaV+o8tpENEw9C5jGm5NU+INx51dWH
	 lM4OrTD3RqLYbOsi1qEoOxCl2Pk+y9PreybacUMUdhWlVH1dlA3F2u18pDKCwafCf48RZ
	 LHJyyTeThbMMTQ2E5GPHHApQ59lGwX8Fx1++ivIu3ddVMTE5wfqu3VfH45DrSG2kWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
	b=bmHKhFCkxhKon+rC7OX65Oeg7y+jbA7X3mnf4svwqtMFdoMxA04H3incinAs3u00/4N/
	 R7RtLUp8CIHUH5x3WkdwsifAr8fI2/K2GCL9rJ0HaZwDP7pXi7RZHhb77YzDrkE88G9aV
	 ziUuxE9WVHwTmj7e5Ny6Lf+IPsyinwTM0u4N6u5IU8xdSoScSKpGzD3f20PD44nT1nAmc
	 SnW1CSCLLZkqAnPSMDG2bf45KRZArLpk5jLiHi9AwQh/EC3qb9TR6OqcCSOHUt5bOuA9x
	 AT3Zp7O+unCrVvMVd7tUSmj3y53jHZ5qFKB8W7woQEMQcmOKM6vUTUIJgk0+aolUcPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=e4PFNw24;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10023606A777
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 13:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10023606A777
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=e4PFNw24
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ea3f6a506so16685826d6.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316276; x=1794921076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
        b=e4PFNw24vmEx9e6XM/cUzCvRERvJabuTvhno9Gz/JzeZWoLyAEqlwt+PiN7PsREzDe
         nbBIpkI6JTuornnBm7/42NrL/w4IdXPpgJMXAMUPCFd7jbdDVIEmKh/jdZ+I+dzViXSB
         H2p2NQNLx9ne0cV1aFkGD5AsPCtzbh2oXhKE+mtPHEk6ablNOVM/G42JAjOhvFRRvEdt
         SknBoahXSauvPineguU97Ohz82cWAZt6yPRa0ML5YUk7kVUMnIDJn8DUcWsiXLLwSwNl
         eFseGz8JV2OEeli+2NBdOH9OYZhu03xI/lkGEnFQ2GC/c8NKeMa66k6Yl0PwfnR2fGbK
         Y+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316276; x=1794921076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
        b=FpaXGcjb+OeebCAqmsOgKJE3APSd926WVZOofSBpOy+Oyhsnbe9M+BnH6KmWhVEnIx
         8wpy3+xWlqK3VgDf5exCir5OAYq7J4tA3BimRTwovWsQ5tNsGud9FsKBGA60wugAuScI
         8gV8UNgfAZ7clFrqcvDW3a+3k+bGr/bkTMP9r2moEi/ILAD+KzZ4x/c5jfm5tlJNRILy
         6ij0XjH55od7BNXyIXx1sybHAT7cJOFyx7Smm/GKkrsNzCP4NtSSZLhHf81E1SW5rBT8
         yI3EXl5lNrzqEKrwDR0/lheeNFOOqesLjtkjfYPbiG52Ku5G+OFY0dbjiBy+rtYwd31D
         7KFQ==
X-Forwarded-Encrypted: i=1; AL+hErFLP/mV2dK80OnlN0wPjawlXk7uxJAJhmx6412MlNk6KzImow79R1h8ITX4kOOsBk09ge2cGvokTT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uGlF54vP6KLsUV90fwgsg2HjYGoHRCUmVRY0a5wbIhdNA1wnA
	lpXbSr+f0AjiNjrY/Rp/Ur8S7nlJiP68qqPanliefCjB/GBvZe8giVwgP+pz6WwCh00=
X-Gm-Gg: AYBFou0ra5bJwxsVy4+ywhPzo9A6zAA04IP36Ck95Nb47EASQ7cX4dOrQgPRB3SkLWa
	L5B+waxqRlZAjk5agpaRNDBF1w+xAEw8R5NHm2EcBuWzVKCIlWXdd+yjKOgxOoUlY9MVZ3/OqYw
	Q7nlZxFyBJ/x9J8R1ZaPMwnFRaTJSFOXsUYaoFmjLksZGMtnsuXDqQOkE3vgcVHeVL6Y4ccBNs7
	wpS/5DdQcPp950aosIZ+Zqhb5rIBURTpVWPFwJ2BMOvJqY78OhTxyDaGiVdHsa9DvDygt9PX8gl
	OafNZlUWwWGp4f3IVgQemoXFgKHC5lEx6VFmVdjK43jPyIsa4CkRAGq+X8MHqCdluPgZDUP4NHo
	0YksvQiaJdh8I6Qaba39n4hIzpApN2YpfPnlI5YwInP72pdKuqfm16nNE/XVfcgg4K15KuW9myq
	B/66Egya3gQHowiu/oJ7k7Pq6Vt4mXV4EvKxYqg4vQotgEtxAZPSx25M2tKiIxal/CEH5A3PWyu
	QEjPStakcNhREqzyAMDnU9erYspEZUBffs+Juz2LLybHSbAjVLBOM09mscR3ZHhS3J1idRtA8lY
	X8vvQ9b0g1QZO+ERz8nFPoSEW4hwUq0UygP5kIK7jCSx8e9X9/Pq457189GiZN3R5hUTBkclc3/
	hXu91RvoLQf8=
X-Received: by 2002:ad4:5cc4:0:b0:91e:96f8:f369 with SMTP id 6a1803df08f44-91eef913f53mr42602176d6.36.1794316275746;
        Tue, 10 Nov 2026 05:11:15 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef052360asm20821916d6.38.2026.11.10.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:11:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQld4-00000005faP-2KGJ;
	Tue, 10 Nov 2026 09:11:14 -0400
Date: Tue, 10 Nov 2026 09:11:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"aik@amd.com" <aik@amd.com>,
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
	"x86@kernel.org" <x86@kernel.org>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Fang, Peter" <peter.fang@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"qinkun@google.com" <qinkun@google.com>,
	"pgonda@google.com" <pgonda@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261110131114.GV663069@ziepe.ca>
References: <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
 <20261109234252.GR663069@ziepe.ca>
 <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>
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
In-Reply-To: <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>

On Tue, Nov 10, 2026 at 01:30:16AM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-11-09 at 19:42 -0400, Jason Gunthorpe wrote:
> > > So we have this SGX based quote format that is fixed because it already
> > > exists
> > > in the wild. Going forward we are moving to DICE, but that is a standard
> > > format.
> > > So also somewhat fixed. I guess the question is: is there some combo of bits
> > > in
> > > each blob we could check that could deterministically distinguish between
> > > the
> > > two? To do this we would need to analyze the quote formats.
> > 
> > You guys really didn't make it discoverable when you added DICE? :( :(
> 
> Like influence the DICE spec to interop with legacy SGX based attestation? I'm
> out of my depth to try to say how possible that is.

No, I mean just have the SGX firmware tell the OS if it produced a
DICE or legacy blob :(

> I'm also under the impression that the quote was not designed for local
> processing in the guest. But rather remote attestation which, usually involves a
> helper service that processes the quote. I've never been clear on why that was
> desired. But it probably is part of the reason attestation doesn't fit this use
> case perfectly.

Even the remote helper needs to tell the two cases apart so it can
parse them

Again if you expected the user to pre-tell the helper that this is a
legacy vs DICE VM then that's exactly the bad user experiance I want
to avoid.

> > > If there isn't, I'm not sure what we could do at this point. There is a
> > > library
> > > Intel publishes (right Peter?) that can verify the quotes. I'd guess it must
> > > have some way to distinguish between the two. Can you check how it does it
> > > Peter?
> > 
> > See this is exactly what I'm talking about, I don't want to repeatedly
> > get into this situation down the road over the next decade.
> 
> I'm not sure if I'm missing something. New incompatible standards seem pretty
> normal? Sometimes there is a container to specify which type of blob, and
> sometimes it is just discoverable by clues in the bits.

Yes, completely normal. The thing that generates the data should have
an unambiguous contract with the OS on what kind of data it will
generate.

If you want to change it, thats fine, but the OS participates in the
change and is aware of it.

> I think the thing that is a bit dicey (no pun) with this, is that there is kind
> of a backwards compatibility adjacent change for systems giving the new DICE
> quotes. This came up in in both discussions with Dave/x86 and Sean/KVM. The
> reason why it was considered grumble-ok in the end, was because the full
> verification depends on updates to the library for each new platform due to
> needing to be aware of new keys. So to actually attest even SGX quotes on a new
> platform, library updates are needed to whatever tool or service is being used.
> Since the library needs to be updated in any case, it can also understand the
> new formats without any impact to the user.

I don't know what you guys have done here. There are IETF standards
for all of this and well defined container formats. Sure to parse
every bit of the token you might need a new library, but you should at
least be able to get a signature verified and parse the generic
information reliably.

If your plan is TDX releases are ABI incompatible with the verifiers,
then thats a horrible plan and *much* worse than what ARM is doing,
for instance.

But it sounds like your library can somehow parse the blob and figure
it out, so maybe it is just a matter of describing how that works.

> But this didn't take into account this generic API, local quote processing use
> case. Which is kind of a surprise and I'm actually still not 100% clear on how
> it will be used.

It is not local quote processing. This is labeling data properly so a
verifier is possible without the user having to manually and directly
inform the system what versions of Intel CPUs and TDX modules it
should expect to have.

> I think we would have to circle back with everyone that pushed for the host
> controlled quote type. Let's see if the library can distinguish them already
> too. This attestctl tool... is that something that could consume a library like
> this? Or something that would have a no dependency implementation?

I would hope for no dependency, the idea would be to provide
references for anyone wanting to make verifier software, and a tool
for the admin that wants to debug/understand their systems..

As well as a point to have a strict injection of sanity into what
people are doing so we don't get repeated ABI breaking instances in
future.

Jason
