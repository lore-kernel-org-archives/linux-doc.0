Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E943D9058
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359545; cv=pass; b=H7/a3QSFRJr6dt0ztZoPs5GkkS8Kfk7YmnFuFCnWQ6SBKEvvDsMejBrLBocrvvnCOXHoWuxEjS1WWRUyyybOxnScHfQBNz39dXbVOCV/a3b8sdSgcZuJkonKy2s02FXhJrhPflTzLWnqxHPtZZgAkYPIO/VitdYsj2mxPlSXCaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359545; c=relaxed/simple;
	bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJrhgx6AukKkaWpvO/bMwcNZfyCElRMSN23nKUDOiVk39LN3//s95RHQlDZCBnL9VL/vBBLZCMGR09g35tUYrWgC5Ygs9iCIvxCtW2Y49xP5FcKasEZkThyjGsPIWGfIoPKzDXlZjnzLdMcKoAscN9H8hNWroHZuLZ7s0CC2Mo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLa6lL+z; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLa6lL+z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so958409f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 11:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790359542; cv=none;
        d=google.com; s=arc-20260327;
        b=d71Lg2q7k4wNSco1OCTwVasef+Cj70E7MD5OnDZj8B2C8eYWa2j3V7W/wvWYt83cHL
         rc69DM/TjT8BlYdKovmFiQH2dQgOR+F1Vyo9O9Uu8rNu/QgKtOUaQFo9UyCm/ZnXqylP
         Tt8gHVTi+TCa26rXSjtVpXJJ4Eug/CZhFJ1gPpMMUsa8zhtGbpAEmwsRi/v8eRvpfcjK
         /YFOF8mCDdkumB/+0ytPRCfB047+bDA/UoUBo3LuYOu1VgsL1C6jhXFPjHGKf2tkhQwM
         +kflz0P354o6sQGo7/Epxsg/NHME4ft3AjBMozpkGg68KAkSMMw3VBrNPJLxz3D8+Cv+
         ZoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        fh=zLpOvPa9xQitQ4+tt1T1xVvYL3GkusToB1GXtgTQ11k=;
        b=a3LuRVFpkSMYVX+xNd099mURd/UBtmj7DRg05ysvBHbmdjff9SLzrNUy7jFP4vWdUl
         X/cacYehv/uO1lD2bcZ2XdRG5gEO7ewSCBapW/uBDFLl+B50oapUozb8lU+5p+SC3PoG
         lf3cHthYeDHu6iICZWqVwg+5/rxr7h7xc5FeYxek64L3tvFcN9XBFxtcPejqaeBDKmEK
         6xzjmLL5YG/SWKVoj3zIuYh0jizAHZI6d+Fpfa+qXYn6rs89x96Y/jPzFnzsBm4V7Wxz
         gz6wYbiEDuXap/32RRTUKaiu9FXtX6tVJK977Jc9c5pXR+raBy5jGvGXFFwk8KB6mG/g
         81OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359542; x=1790964342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        b=KLa6lL+zPRyMOjuLiH/8JgxeU/fAGEsQqf4/nPlCjE3PJ8wWRNUw797EPyMYOTDIQ5
         C0tgmoI8GCj5fbRM6DHIsp+OagNx79Yl4A+FO4AZXXXtgdWRmyR1GqzBtyVmP/59ZG0E
         mwKAPNSpRtQTSR2lUdHX/bA6IMuZNLck4FwGrKMmmYIf2AJB7H8lWPf3Y0z6s1OOA6oB
         F7RgX3ZPO2iR/xKGlqHgeQneyqgLtChQw0jX4prgOgGGS+iSePcbcjXXRia319pVtijf
         QmNOmibxTcQW92MBWq6YHMaiOqk7uty6IODSQstj6DyIAnQluDHV75gAsuwJSSnf2ZsN
         dxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359542; x=1790964342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        b=Fg5115qvsXHUtKgq/quA5MhQGpbtHuQaWm4nGcwEh4Bq2YZiqCr8qjnCrX1owBrR/m
         8l3KaB2l8oSuiIEqrnUwX+8p0aDjTzMf8njFUltxPq7SKV3DADpy0CuLir1CSHiVtUYb
         NIiSnamolvb/nEhP2TdxnyifUh11uTEOOYMI0xpvX0G+ShINriiHfKCpAUP+cK+qvuzt
         j2XzKngYSc1QDd43s4r4Mr8ETiaV58Ib0l5zpj5nTPouwAQzEMMbWnQxMUp9UU8RsbD0
         MNCg0tLtlogv7g7Ouz2enebQvHml6VVNbJl/UavRPIGUDw3ugklabWGxI22DHGhIITyj
         UZuw==
X-Forwarded-Encrypted: i=1; AKwUvBxX4/nvNE8qhbHpYmZyqJdtPTrqNeMIDebSLgcQuyntlbPv8ZwHTNofLL2BO56kJ3SH7RsIITZ6ia0=@vger.kernel.org
X-Gm-Message-State: AFuF++kpdPsf0wkMZoCYTG6VvXGmiEEKyL6QlLmJs1pkqprt94dsI0Yz
	gj3DJeWkKDMBhmgoDFQSKSL4EAiDY5OL48bC0kA6Fs0ISC057Jq8Oq9iYOBFOPBT/dcb5tu8/sh
	yACjI+Rt1z/h594N5nXwgReKwEtLPkpc=
X-Gm-Gg: AYBFou3FY8pxYK4VM3g/PExO8NQIb6bdlUsdyE9bRqvp33CuMF70XXHhfVKtLsaMPau
	D2ZYRyubC6VPp8ifLQJ0/YOCEjzRfx70OVzaP34WuftPEflGYJmJEP0RFM3nxD4V/K/UWZrdK8m
	SCB/0N9TTIBFxKdOfvmzUTZgZ8pQaMVLjjo9Z3TKV4vdBk2VFuAtmVLnp/LXhXHfi73bnO78olw
	hiBvrlQ/9kHlKrPiua+2muuW/sS1X7AC6Iy4fi95CHhlWad/p3iAjohM59jeas2rhMfM+3VJGaK
	SYCrZczm7jto4zYVtPdaHMz+rO5tZmppTcYjJv6kfwOshghTPURKY6+AMqh8P45rI4AOAjeX5yO
	8/Y+tGXcPe+Mh5nb0lUMuZQ==
X-Received: by 2002:a05:6000:2284:b0:488:8011:6834 with SMTP id
 ffacd0b85a97d-48880116940mr4896261f8f.53.1790359541945; Fri, 25 Sep 2026
 11:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
 <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com> <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
In-Reply-To: <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 25 Sep 2026 11:05:30 -0700
X-Gm-Features: AclHuK-FobqVPyDTMFnDSZvekiS4h2oZG-GWPYqDDrJKQs4ZBSnYi2HsqkCoGUU
Message-ID: <CAKEwX=NQtWudSHhR7-bbL8PuwFEW3uATj39DhSG4LR+mLVSusQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
>
>
> 1. It moves the metadata from a new dynamic cluster struct and shoves
> it into the existing physical struct.
>
> Like, you can check patch 11 of this series. It's practically the same
> thing, with the only difference being ou

being our interface choice.

Sorry that got cut off. I must have accidentally deleted it.
