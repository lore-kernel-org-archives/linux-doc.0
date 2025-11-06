Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7F934572E
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441040; cv=none; b=ONRH+xm37pEa5wtmhzm6XS3ch816sWxwKAlK8HANnoUFoXnGpIDbjyFw83R4X/Jyfb+eVYoc0zat//OXDyHai+YC0LNUyTHrj5r+JVUUXWrNQxTb5DcgkNkUtV8CZsDgjc/I7VvsYnGc2MY3Aa+tfjzKdOxuhF5wBP7Iu4D4HSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441040; c=relaxed/simple;
	bh=RRJi4BWOSt/oUeeiLS+eVgUBIjfhPebchxQneC5M2X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7j0s0HnXbomhkLAh+Yk714mnClnd0wkF4QG06mFkBun4CIfGI1TPwE2021b5RcLhL9oVOwDCTHIKw+2D6PmgHLKY7dJFteMGMb8PhkvjMkkKIaQTaGvCbXWxvkkUkn/0K8x8OkRJXpS24QnRYyOgiMXYQWXKjUDy+/0BelCEgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=asxn3JHy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ASHsC/KP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="asxn3JHy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASHsC/KP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762441036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRJi4BWOSt/oUeeiLS+eVgUBIjfhPebchxQneC5M2X4=;
	b=asxn3JHyFBn5l3yIpqXcoEjjmiEteQbBU2VtPRQxmq6+4sOiUk3Jj4ELHL8fpdWlGbzLTg
	JFA3PdXzSR/sQaNJeuw6I6Cv/y5zXikw/tqLJFlK5X+PkaBjWu/1V2QmbXXL8qvbZdSgQZ
	q6s28FgcNU6jHmeUhAMvNPHJ84SidSA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-pfd8rsEJOZChFBdKLRuIgA-1; Thu, 06 Nov 2025 09:57:13 -0500
X-MC-Unique: pfd8rsEJOZChFBdKLRuIgA-1
X-Mimecast-MFC-AGG-ID: pfd8rsEJOZChFBdKLRuIgA_1762441032
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-59436279838so791793e87.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 06:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762441032; x=1763045832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRJi4BWOSt/oUeeiLS+eVgUBIjfhPebchxQneC5M2X4=;
        b=ASHsC/KPDgfhTXiT0CoVt2G35pSbi1UUL5NaazZqXroPhozIUmumF/2ZRjbP7kESUT
         MzMUcl9oAe8FKn/yLOPG2lMpNDWai/2rhLeh0H3y6qPveSLxenfcZ1Qa8zx8jGaDGSqJ
         LQZT4LhC9is3+6zdmB0rA6qjMW6XIEmGQHV8e5GCO8NZbvhr8KSfxG23K6IBqsiPSlI4
         qVGubdl0+uc8Oh/2+KC2uWmHWQV53+dFsucNu8SbZcEwXOUDK4Cr84krlU735Le02JBm
         +L3oCKCdvDTl1DaUAMUKAT7Z3jOW+fhk1SMX3/KlZphc7/D/8KMpGNycsH6Wb7Td7l3j
         KqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441032; x=1763045832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRJi4BWOSt/oUeeiLS+eVgUBIjfhPebchxQneC5M2X4=;
        b=vvDlkNGqgC1pIl+AN0fDDvgiG3UYD/rte7N2K28MZJk0p7kYXNZNXQXWVY1Fk4KFbB
         ombdM92iZtNgk0BSSYZ/wzXPzHX+Ox7UNgPwGU12hdYHmKLRi5dD/eYQKpkYLnOwotun
         BAEl87NTXL1I6XqlwW2syaO5x5isT3TeCuu24/yKW/Thhm1FWg7mfEHbwQBHDrIl7eOh
         km2vIrCDYfEIhVkVyxBqTLR3YJUGdT1AI5q6e8Bt8ouI8oMInik7V5oNHRv1BqscvuwO
         WcJmJk4hzZ1LJEpj+s2CuoEx5/oj0JiWhkA9lU4trClOch0fBbjwoRG3sRQrw9NW3oQx
         CHrg==
X-Forwarded-Encrypted: i=1; AJvYcCVRQ7xGL+viD7HnPa9WJA1KeVO4Twc2bm4FtlBATO2ymVfl7um7pi5Y2hMbseJT+6ZTr1cy7MyTkr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy19T0gzElU1ZmjRPh841yoSLN8RkairWjgrQREiteBJgtxXPy
	Evj1cxGB1mSCVEcuTl/H5ieX3HO+gCfOAdKk1dRWFG7xlZ7ILeKKOBst9k5p7fkN73eF+ULunwI
	uADwrDJ2QOS04ygLktxnfZn+a6iNrZN2ssw8yTXCg1XMUlPa5jF/xfjFV9Ki43wy+cVrpod86Kz
	sd/fhH5AxcYvnMCl1xnG95pq+y8cJS9gdsFzf0
X-Gm-Gg: ASbGnctXT/afrfdq+9yTQl4HeI7DuiURCC5zxaeAG5sVSumXqsGZ0dhETrUDO8M00xh
	8pnOvri62niGgAkKw7phqnpVngon0g8SfdD4/shacLGXWxPWS3FRUAvPlTBgeaNfSkCOHxu+vf1
	AEt4T+gRZIB091iApXP/kN4OIjexb3vAmKjXv0fjWFs24zFS0rjTVewh0=
X-Received: by 2002:a05:6512:124b:b0:57b:8675:e358 with SMTP id 2adb3069b0e04-5943d7c044cmr2516345e87.21.1762441031665;
        Thu, 06 Nov 2025 06:57:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtNGrDwt4RbOyF6y8CtvYQa56ZITXl4wPjOUbeGGR+zBng+d1yiIB83ABcja7XIQgf5a8pDswEdEPmhr2Khi0=
X-Received: by 2002:a05:6512:124b:b0:57b:8675:e358 with SMTP id
 2adb3069b0e04-5943d7c044cmr2516334e87.21.1762441031201; Thu, 06 Nov 2025
 06:57:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103125757.1405796-1-linan666@huaweicloud.com>
 <20251103125757.1405796-5-linan666@huaweicloud.com> <CALTww29-7U=o=RzS=pfo-zqLYY_O2o+PXw-8PLXqFRf=wdthvQ@mail.gmail.com>
 <a660478f-b146-05ec-a3f4-f86457b096d0@huaweicloud.com> <CALTww29v7kKgDyWqUZnteNqHDEH9_KBRY+HtSMJoquMv0sTwkg@mail.gmail.com>
 <2c1ab8fc-99ac-44fd-892c-2eeedb9581f4@fnnas.com> <CALTww289ZzZP5TmD5qezaYZV0Mnb90abqMqR=OnAzRz3NkmhQQ@mail.gmail.com>
 <5396ce6f-ba67-4f5e-86dc-3c9aebb6dc20@fnnas.com> <CALTww2_MHcXCOjeOPha0+LHNiu8O_9P4jVYP=K5-ea951omfMw@mail.gmail.com>
 <c3124729-4b78-4c45-9b13-b74d59881dba@fnnas.com>
In-Reply-To: <c3124729-4b78-4c45-9b13-b74d59881dba@fnnas.com>
From: Xiao Ni <xni@redhat.com>
Date: Thu, 6 Nov 2025 22:56:59 +0800
X-Gm-Features: AWmQ_bnBMF115EOOjA9vbLZ9uN5wB3kN3ss1NrGOT0tRZSVZHKdKZOidba_fN6I
Message-ID: <CALTww29X5KizukDHpNcdeHS8oQ-vejwqTYrV5RFnOesZbFhYBQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] md: add check_new_feature module parameter
To: yukuai@fnnas.com
Cc: Li Nan <linan666@huaweicloud.com>, corbet@lwn.net, song@kernel.org, hare@suse.de, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 9:31=E2=80=AFPM Yu Kuai <yukuai@fnnas.com> wrote:
>
> Hi,
>
> =E5=9C=A8 2025/11/6 21:15, Xiao Ni =E5=86=99=E9=81=93:
> > In patch05, the commit says this:
> >
> > Future mdadm should support setting LBS via metadata field during RAID
> > creation and the new sysfs. Though the kernel allows runtime LBS change=
s,
> > users should avoid modifying it after creating partitions or filesystem=
s
> > to prevent compatibility issues.
> >
> > So it only can specify logical block size when creating an array. In
> > the case you mentioned above, in step3, the array will be assembled in
> > new kernel and the sb->pad3 will not be set, right?
>
> No, lbs will be set to the value array actually use in metadata, otherwis=
e
> data loss problem will not be fixed for the array with different lbs from
> underlying disks, this is what we want to fix in the first place.

But the case you mentioned is to assemble an existing array in a new
kernel. The existing array in the old kernel doesn't set lbs. So the
sb->pad3 will be zero when assembling it in the new kernel.

And as planned, we will not support --lbs (for example) for the `mdadm
--assemble` command.

The original problem should be fixed by specifying lbs when creating
an array (https://www.spinics.net/lists/raid/msg80870.html). Maybe we
should avoid updating lbs when adding a new disk=EF=BC=9F

Regards
Xiao
>
> Thanks,
> Kuai
>

