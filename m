Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5E21D3E6
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749301088; cv=none; b=dPt2lLcye4hsfDh+IIzD10KtSIM00jnvpjieFGPW+Kk1qtlTpcxbw1Xj/3c5l3UvkCeCnLM2lOXX8hMlQYacdAFurNgadusFBJZkaoKDuaHrA18aUH1UEfhuulvZpt6T/ZiShfHbVO3Dg4RTeyJdQu1QlpRwJzG4fGt3xUJpTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749301088; c=relaxed/simple;
	bh=V4cryWcS+Nj3c10ZcXrTgRlQMw2t7rBwE5/Fuk6/am0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIuT7NT19KvgAmFnycslQTlplaYPMuxlszipOjmaAfP4/RmgyxBr+MKPt6BV2ji7/8UuKb1ltsYXNNv9Bj+1B6TZLZYkMLpEkATw4z8uOdhXN1oaVKl4EWf+e2JEUzRR1I7/q/EUyq4WtAtPh14ZpaBPFzoBuvPopTOfkO4kpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dr5fNeFO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dr5fNeFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749301085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUlpd1tc6ViQoEOVd98R/NTIIePNhea6XdH/630s6S4=;
	b=Dr5fNeFOe3/FV84z6D/Y3p1fhuvB7T4cEx7+txR2kdhqxH4ln1/FqLfOwvJTMpVCphaLRV
	u1BVIi55JMSBgAR4vzLn7emjgZeomQS0+yCAyjFP9K9bk4SO6tqTC2Hivkzcw+TunCt/Mt
	+z5xRGob/9/1wk1XEpp08dr/KwKgisg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-y1xCDdG-OFuFeSthVZjRqA-1; Sat, 07 Jun 2025 08:58:04 -0400
X-MC-Unique: y1xCDdG-OFuFeSthVZjRqA-1
X-Mimecast-MFC-AGG-ID: y1xCDdG-OFuFeSthVZjRqA_1749301083
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-710f05af33eso30999657b3.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 05:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749301083; x=1749905883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUlpd1tc6ViQoEOVd98R/NTIIePNhea6XdH/630s6S4=;
        b=KRCzrjk2gPhoEOtgwIsMDICW+PUWfQ3CTRFrE+IEZ/pNp9p6IJpveQ0t5UV3E93BLC
         A6wirxr1TXNeM8ULycB4hP4JJ9fi7tyejStjIHcRQuDUt/CCoibp+BU+ehYF5yYMpT4S
         rsiXQzTTkSFlfmfFNtqoBib/N3CtRxIwYdXqYe1Kbv0hPZOmHICVMBc0kvl/JYVB099i
         9sR2ocWA7D7MUu+rWpkhm7FtAkCpuaO9KQBwFGs0RLbmw3y5sgs8pp70ElPZQKCULIH7
         qngqqHc7A+jv8+lIZEz0kEfFfIcUkfD+bSJuGopMvzTJqxQC5TszqggeLPyKMNcTQDfc
         zo4g==
X-Forwarded-Encrypted: i=1; AJvYcCVVjr24xRdxubLj9JtJkHuwzfCy6ViQ0BFDj+HJ/fkkcr+4P4/A9v9Pi63j/7pGXeDHy2c2uoqD694=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOKUTedbPF1t5qU91JK3QB7iV9sQcUK118yYIefjFtR7+aoii
	WZoBOzB660Fvb9Q2RNP1hxXhQO38fwpMnLCTBU0BZ3WxcfiBo0Th1SaIoOuQTFdhtb6rVHz7BoN
	yKm4H4M3lmrC7TTvqqhYrpvrhFMh3RK9knb7BfkMIoUQIeW/WDs30mDSrr6UxGRbWXnPBmonY7d
	NkRII/MqxnX7Ep7fd4H8HBkRdOJgnCO45mwgC7
X-Gm-Gg: ASbGncuE2e8+CYIhJ+oezOnnqFV7F76sjzRQCXlp2br8UZrZuXQtz2ptWmpzAg4e35Z
	CA/aiAd45eH1ymoFXMhXHb4aA6ZWdyv7AMjRjt1uUE9h39MChWeBskfLlhtqnHI5aG6XFR3k=
X-Received: by 2002:a05:690c:64ca:b0:703:b3b8:1ca1 with SMTP id 00721157ae682-710f762d3d7mr95493957b3.5.1749301083327;
        Sat, 07 Jun 2025 05:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzPMOgCNk3VE9SsfKXmuZM+nB+7y+ADlZL68LpA3zUBsqHZyGJebHmJUwK+oL+gqMhq7Kjom+gmPFEsKAmSD0=
X-Received: by 2002:a05:690c:64ca:b0:703:b3b8:1ca1 with SMTP id
 00721157ae682-710f762d3d7mr95493637b3.5.1749301083000; Sat, 07 Jun 2025
 05:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-13-npache@redhat.com>
 <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com>
In-Reply-To: <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Sat, 7 Jun 2025 06:57:36 -0600
X-Gm-Features: AX0GCFt-sIirhVY_s3fqNEN_w8JX_uHJd6OXJSEG9XOqi8-7-ivm0tpji4jWrKU
Message-ID: <CAA1CXcDOEdJRvZMu2Fyy4wsdy8k8nj4c45s4JanO9HzyJgyXOw@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 12:45=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 15/05/25 8:52 am, Nico Pache wrote:
>
> Now that we can collapse to mTHPs lets update the admin guide to
> reflect these changes and provide proper guidence on how to utilize it.
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  Documentation/admin-guide/mm/transhuge.rst | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/a=
dmin-guide/mm/transhuge.rst
> index dff8d5985f0f..5c63fe51b3ad 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
>
>
> We need to modify/remove the following paragraph:
>
> khugepaged currently only searches for opportunities to collapse to
> PMD-sized THP and no attempt is made to collapse to other THP
> sizes.
On this version this is currently still true, but once I add Baolin's
patch it will not be true. Thanks for the reminder :)

-- Nico

