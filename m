Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792686873;
	b=ZpngI9UhDKzVJQxXLYZu0iYtVSbjkHCmyHHlpNde4zB6pBcftSCn5enQRkrdzdbDPMty
	 wIyn6crNf64lbimyZhBUB5Ggb4FDtJlnR3cQiCLJLcC9EjxhxWYqous+KDx9oQSGQcVwU
	 qiEPrfeLNWJ+0ZD26e9dNnWtq/XMz/PPL7Y9BgK98s4kIRhknI/jrnuHVVajJKgbBz3qL
	 2s/aUQYPmC+KQd0ANHsKD1F+nduqeRcbuZRCXHAuxIU5JNlI97JDOyYNdXT2iiAVkECNQ
	 qy0JEHORAcascuufYQJy9pENasASV83hdibC19hQm/4f/pH/1j6N1f2iIKWAV5LGNQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
	b=RyUJSM1wzowlauDJceW5be+mEBm6rZRUx+LjrY6lfHYZi/jh2nUsjrRQ4VVh3TNEoehf
	 Q3ItKIahnqWxpIWAtbpjHLhrtL1ldkGShp6vKaftSzCs5mjEfIom7e3xjr5G2L+faF8eY
	 5GTeE2wFHVpK9zQzta6N77AMx7Pd2w7eBgnxBfh/5r0qsBGwJ2BYVUulLFR9TNeThjg4t
	 k2C4yN3i+FXR62S/xUzQKnhJfr6S3vzcn+gvtYKoX0pSMoL4xINnblvhOpCCLHsDc28Zl
	 nn17jpQtjn2gRZ9ilb481/eGXz/FjoRPiR1/3zNdcgJ4VDFThj8emUFIOa2lN06HBOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PZng0QPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DC606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PZng0QPq
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2434551a12.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792686871; cv=none;
        d=google.com; s=arc-20260327;
        b=QtzMTiWY4OSKhMERdIRUInFaZ9GKBNdN/9t25M0U1y8OeM159xJOKNs6/4Ty1DhxAj
         2XN77paZ79ERbQwcDP5uD/7kE2K2rfA9hJVSC+S0MFT7ZjDaMmjKIgzv2bBS6AMme8dv
         qEP6HjTubaLMgJBi/8V0B5PdQotgo/NbgtW5G4UZrnhL/PH87TBPic/E1nuz6/16iQ6z
         pwfwsKD88mHMf5GflMKfX66xLVKx4e6qA8LU8KT8t2uDfpmz2V7XUV75/iBCFmY1GsA4
         lEA9mJQNrfEMswAiTLYBlrr9Ig7Kv8Xu8KjnECqMHYUHjaTpd3eGnma5iVPT4PzKC0NS
         hqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        fh=pN2gECPdPtNaU+24vycT/QzmGB5BiV8OVMFAW0bgY8U=;
        b=UyTSaiDVZdttLR7oht4m+UXw3eO1gsICL7g0hS25l+b5L/Qt81V+IL3//3VAa+QmmN
         ZGvek4zBUX2Jx7XYqssUxogMKh2tzN+q3DgTRl0MsNQ6VnR9kAJlAmHISh19fIIc+9op
         kffEUExVj5ZNgK+cVN7AOe+XE5N9WN+zwudlZ+DOGeq9nqYEuQ2STAeD5bYyUoEVDg3+
         Us/axlK4DaLRI+4HWxIUXk3aEbRIggI1kHS5GdaaJcZoSa0zayUOXQ19dyJAoBnreDIn
         qYrRZ1CBgz/cm+ilRn0OPnnRlEYIpE1QL7VcYbyJVyzh/QDBObl7OCPCQo4F1SxKehf6
         8YdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792686871; x=1793291671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        b=PZng0QPqnkPtt42LAfKVBRavC2IhEv5q9gK9vz0hM4RHNUKOd1Z4E/+UnW1dFtDIgj
         oH8nk9TzVQKQXKQiOC7J0KhqN1VeoX0yzD7cGOEg9cVfVhkss8D3H61XifTitynoFc/v
         BTMiu27aMFrpkc2uKtjF88GrWc/GKL55QFfn3zvKe0JuRopaiif0JgxKrmKrXlerAjCh
         vBYOGSW0FaswNMuYAMDdlLJ24kjttb+m0JVuCOFog80ZejKTpx9YIMMG3vsVWzUOBAsk
         RN0pooI9g3mRd6wY6klKUv4QZ5TNH/RNbCCxs8JMbdSJCVXnBejKeF1DYvx8tecfqcvh
         J2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686871; x=1793291671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        b=L1PMOrYzSmqzl6/tJNWeNBVj7z7zbcz81A39fF9RmN6X7ZLJGh59dRRPj/33tDtygL
         7B5iq8p/Wgvte6OvK8c46zPYnQE6vFFsfJ1jqXCp0u5Gy5tkuHgV/Mpsg0hdlflol891
         C5bej3LWEl18wHDIAPyYBZ9i4o2syzyc5NNt1A1lghjg0iLa4s3FWce2gw28BtogvBly
         OOpMJtktSR7TrzBsI8new0OImSaJoKBkIUFHDnCJLNSIaanXjdCf2T7joSVgOSK9KRfn
         zNESTJbH2SPrn2ol+LuHXp/DJQd437jy7WyPU5xh3husJYbKDtKghBECaiu8zlre/yT/
         WWmg==
X-Forwarded-Encrypted: i=1; AKwUvBwShgVo590dcVsVJ5GtmM1jjZ+GGgUoucXqI0v44/WAmAAJ9mAZdeBgvQdnpBtTSOxe7SJZ1i0XvJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuYVs2v+eTFm2KQG0aBe7wdlOoWLIfbT36ssQ69d04CjzkTGBn
	psLXwdoD9VSw7ZrixhrFc3mKMPFQdzjSkCgDBn7FVLN3hmgN51EMPdMb+0pw660cyc3U9hWVdWU
	cL7c1nCXdXZQ4UjB3JuWdAik3NtsBGFGTCVIE5+Oqng==
X-Gm-Gg: AYBFou1qkNUzhuIoZV7OBXaPpIj+V2Vb7hfJietpbttIv7wtTDN7S2j0vaxyRYsYqYX
	MDikqp/lGWULLssz21zMNGARXAtSq6Xeoug11Z5Cyy9cdGXz5XIcnirt63zoNZHeSQrOgGFsHmZ
	dKCrhr9tdYk7/J3eCTll5zLqm/d2cdLwnswkT7zRgs4OzwXZrijpFANAgRJ+MOQmx7g17h4mlJ7
	FfTU7wiW24W33d4noLzW6qJJuu2K+aRszVaEoEXuJIMsplBCEB72OveFeW09jfYKoVZCFZyCGXU
	+fGP+YZQdzAcGzRoiwBDSk4+BSDKTsLIeH1I85yRPffau0g4hOntvkAiBf3E0YyDwpPoI0HJJfs
	6vkHUUYHp9GNTRxFdWUzA1EHRpX/vLi2lHyieRIv26YUgZTjNmpcJym1DtDE+pzWCRKqc
X-Received: by 2002:a05:6402:21c3:b0:6ac:8dce:5a8a with SMTP id
 4fb4d7f45d1cf-6b408e97bc7mr4806912a12.9.1792686871349; Thu, 22 Oct 2026
 09:34:31 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015020313.946940-1-pasha.tatashin@soleen.com> <87y0bp20pn.fsf@trenco.lwn.net>
In-Reply-To: <87y0bp20pn.fsf@trenco.lwn.net>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Oct 2026 12:33:53 -0400
X-Gm-Features: AclHuK8Otm0xJpYhkHmHhBvYvdF9NjZJWWHbtCPr-MhhnCbHqDLRJoujsYa2diA
Message-ID: <CA+CK2bCj9mSc5xu0B3QtxgRd=P1fo910pO_fx6f5o_Wu2YDTbw@mail.gmail.com>
Subject: Re: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members
To: Jonathan Corbet <corbet@lwn.net>
Cc: rppt@kernel.org, tudor.ambarus@linaro.org, mchehab+huawei@kernel.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, aleksandr.loktionov@intel.com, 
	kexec@lists.infradead.org, pratyush@kernel.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:51=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Pasha Tatashin <pasha.tatashin@soleen.com> writes:
>
> > KHO ABI structures declare their preservation pointers with
> > DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
> > and its physical address. kernel-doc does not know the macro and does
> > not see the member: it warns that an unnamed member is not described
> > and that the description of the member is excess.
> >
> > Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
> > for DECLARE_KFIFO_PTR().
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  tools/lib/python/kdoc/xforms_lists.py | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied, thanks.

Thanks!

>
> One note... these:
>
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
> > prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
> > prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
> > prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
> > prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
> > prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8
>
> ...make b4 go off on a wild goose chase and caused the application to
> fail.  They aren't prerequisites at all, I'm curious about how they came
> to be here?

Sorry about that. I had this patch as part of a larger tree with a
bunch of dependent branches, and I generated it with "--base=3Dv7.3-rc1"
without first rebasing the patch onto v7.3-rc1.

Pasha

>
> Thanks,
>
> jon
