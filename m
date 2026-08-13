Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30163EFFC9
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647100; cv=pass; b=KskHKAA+1ux3oXnaxIogF+8EAYlGBR7WaTsKrsv2EdKbF2H/RoNiiF00iC8pWvpqGEaz7Yp2T+H/FXJcGkxAj/+zNdBAHV+OOmd99zTGbyNPNZrCRg80zTZ04TbBqqSQJ8sZPCkP/RB1YgrEDtmvKdwDVf4F+kUV7gfQKfTXegg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647100; c=relaxed/simple;
	bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMuARYE7s/caR9dXTLfCTrnSuxj1p/TUxLNsEjbl2DKm4dFYW79FOOIvpGRIEUwLkqt8xgiX7amfiJ66/Ui2ggCo+/NZob9t7XpudH9GhRCpbgeBY1sZb9OEThlNHJ2/h28nsIqMaD8pkqtEilDeaFJQ70lJa9O6644nXfbwl08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=llOgoqHZ; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="llOgoqHZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso103542a91.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786647098; cv=none;
        d=google.com; s=arc-20260327;
        b=np5xFmD1e1caaSpnTktQan0WFWhE1TrQdm34d+HuLH+MkUEXwZcMIDFT2xdRHrJmn3
         +ZxJE/vCK8vzOHDW6BXODEFqje+uOeYNpH2Z0yfj0g3F0JV7etvk1PBw1YrZeci21m6l
         03gevzCvMKXqOY9d2Q+1HVCe0rPdilyiUzGxlzMTvxwZg7KeJd9/eD/TLnujyyZGXL6d
         Gy1VpRzkTWXMWJBQ8rwtNT+8QoPRPqWfEqcq3Mnjk3OFzdo6Qp8zmMUZv4qnY3+d6I4i
         jm3yvByuci3MUWk371a2yLoGOQAJDRsjxUrHpS2dVU4SQnL+3OPk7kM3uqPvQCd72tiR
         iLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        fh=htiW/7eQLYg+VnQnOj7fcA1eIcUSlALqr91Dp4Pmr9k=;
        b=r7GAXFT/hvOdgbW1qcsdp4/AO6TFhtBOGR89+tlq2YRkEIVkhsGyvA7mC7EPSvMY07
         4jZ0GlZC63jqVh30LWaIhwYCauv3tVeYOo1BbWiHbLtwJKDoWxWcxK6L3EyrG68omb/d
         nKxpx5SENqu9XczjEGSTGfUZVKkpp7CQDH5pVCg1YzHDlY5gQEKOD/OJFx6y1S+bGhEJ
         aSKkV2NzBYlvhHRi2bz2UX42YTNr7QmvhSz3D4IuffkxGHYL5idVWYsULp6brLGPQKOX
         VOdtF6pEf+ea3Xch6q+RDvlWSBvtRUmFC+HztfE4ck4eNeLTd4smAcvS1Q85kpVFuUm5
         ZhwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786647098; x=1787251898; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        b=llOgoqHZi6OxkI43AjwUwrPF5WbjEcaVshHgvpJ8EhGpy1qFS4z9v2QCzL+EUQXNJp
         lYMDECsMWialckL3BnDh0whRpYd74jDrai4iWSuq9KAmBUeo8Qwqp0OgmAg8WhWVFpGs
         0MK6yBdX19rXZZxs/AYmnRAXX5lgrFrLq/ZoCNUWM1x5Halpp9uLSfLD4VWXEy3PhnT6
         sGM9g3x/lAxHjLwHoqbXJc/Y/8XE2Nazpkw+8XTd9yXnZyAx+Kkwqe7i2bq1Wq+uwyqD
         BZvXJAMPa/MniY13cQfBslO8rWQKTJ1CfxSKijhum6aempPR7E+D47zYEMqI5Zydf9ur
         on4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647098; x=1787251898;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        b=UIB79XzSd5Rp6HrhCm2o8gKs6tiyI8WIJzh9e1sT9z53RtzhQls+x2i/nsrCCm3+DD
         bk2+ztc+tEl+A+hLDN3/1Lc3Z9XU82b5NI3n+CUI0S0T9JEfwZoMRyFOSX7XLzchZ9Kl
         FYKZBzKRid/mGvGqG91DUnYl5tJ/4kzKDiFr3OD0MH7TnnlxBJldOrdUlkk4Cns4/0Rv
         X11KFCn5G8HmpQMYP0N/Z5F1rTPsfJkbt//OlEajMWKKX/Znz4SC+puvTIf4/cOdETAW
         VauDrPdxkl1gJV5Wyar45HC78P69kPYgIRlbQsrLIw/nD4x1gqrKlKneIlPDopnvrHre
         tO3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr2GNqNsLoQHTaCOo1FXyOvYTao3Pr1RZWO3+XFMO8/J13oy4eKXxSUN9Y3r/YnHcL42H8zSTO7zgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEdMcRmVLZbkJp4lRFBZt8M+BX9X06B7CFWZZOC5AqBaq75s3
	aJMzIvbKepIyr/w82CMWhXX274PgijMfWmbtFLETC5g1SLShvatk7HwZSTgt+cho4shg492luF6
	WWFfT9EYbUZ2f5F4tYRZgp/4Sm7KrG+cM5DrTR+Bf
X-Gm-Gg: AR+sD13g82BiunjrbSVHqs4B+zbAtz+s+GIjCvaSrbQKu+Mu2fyrrbmXC44urUW8WZY
	iGfSPVLw2scYmxPz4hHUmxQhXRZ8gRgg1vqRxKNMPNyEk+OsA9YoNtr6bsHYUOsaVsLDL7R3sT3
	kYaPN8slSXXMkoJf1heKmNIRtMJxxeIULUPdsOaQ6GtN9O+a/ETWyX4qsAd7ir6XIoz9d+Zstwg
	uYh8TX+5yUwSB2llQp31smG+FOxnN1zbbqrxqeNByRxkCZdL3dbsn22Lks2PLpVrPofioXynumG
	um55h2RFxvznj5bPwHbmNAkdTu65wXHkXD1hRjK+g/QEjWR8rqeVsjJ58p5uf+9sP4gnbE2gKwK
	B9no191qej572ZtGicYG90YHmwGZyQ5o=
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id
 98e67ed59e1d1-3931f5f5fffmr4564862a91.18.1786647097635; Thu, 13 Aug 2026
 11:51:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:51:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:51:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
 <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com>
 <anp1I64K0KeyQuyo@yzhao56-desk.sh.intel.com> <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com> <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
 <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:51:36 -0700
X-Gm-Features: AUfX_myWEmd6jjOfyL-08bj4iJ8X-_1fqONSad0Pn1FbAvMHKm6jyQidagK1AHQ
Message-ID: <CAEvNRgHxda6XK_XqWaqqVnA7oW=Fhp_C5gF4vNcL+-HfwfXMqQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"x86@kernel.org" <x86@kernel.org>, "tabba@google.com" <tabba@google.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "forkloop@google.com" <forkloop@google.com>, 
	"Annapurve, Vishal" <vannapurve@google.com>, "willy@infradead.org" <willy@infradead.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "wyihan@google.com" <wyihan@google.com>, 
	"pratyush@kernel.org" <pratyush@kernel.org>, "aik@amd.com" <aik@amd.com>, 
	"jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "rientjes@google.com" <rientjes@google.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, 
	"tarunsahu@google.com" <tarunsahu@google.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"baohua@kernel.org" <baohua@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "yuanchu@google.com" <yuanchu@google.com>, 
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>, 
	"nphamcs@gmail.com" <nphamcs@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shivankg@amd.com" <shivankg@amd.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "youngjun.park@lge.com" <youngjun.park@lge.com>, 
	"kasong@tencent.com" <kasong@tencent.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "weixugc@google.com" <weixugc@google.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"brauner@kernel.org" <brauner@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "liam@infradead.org" <liam@infradead.org>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kas@kernel.org" <kas@kernel.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Tue, 2026-08-11 at 10:35 -0700, Ackerley Tng wrote:
>> > > Would like to see what Sean thinks of this. Either way, is it okay to
>> > > follow up after conversions lands?
>> > Let's see what Sean thinks of this :)
>> > I raised this because the issue was encountered by one TDX's stress
>> > selftest.
>>
>> Which stress selftest is this? I can try running this on my side too.
>
> We have some selftests that are built on the basic TDX selftests. One just
> hammers the MMU stuff with a bunch of zaps and also weird stuff from the guest.
> It was eventually too much work to try to keep the internal enhancements rebased

Would like all the comments we can get on TDX selftests v14 [1]!

> nicely so we actually just run an old branch's TDX selftests against newer
> kernels. So the branch is a bit of a pile, and not really suitable for sharing.
> We plan to clean it and upstream it when the path clears. So it would really
> help to get those basic ones upstream. We remain happy to help, so please let us
> know.

I guess at this point I'm hoping y'all and Sean are okay that this
conversions series merges, and we let this stress test failure be
handled later. I'll be around to fix things :)

I'd say the line of sight to fixing this would be when the KVM MMU only
gets PFNs (and no pages at all) from guest_memfd.

[1] https://lore.kernel.org/all/20260722-tdx-selftests-v14-0-15ad654a50db@google.com/
