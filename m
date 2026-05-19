Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD93769F1
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202168; cv=fail; b=n5xjqtnB6h6f7UMNrmCso+wc6peCG+kZ/2qUH85YR94K06mgu25TllDldTcWZMxhZ195/gTdA7XDKJs1qMX7j41hi4sxIsZML2O2yJj7fmcD2JCZNiT1dQe3yLyxNNNy27t8MMXHLiN/P2AFKxsOin/rVNRFsPt0rgV3pdUaHT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202168; c=relaxed/simple;
	bh=n9uH0ls8xtgEqCIJfirRHZ+k9wYffSaIob22jt39LD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go7fBoZy/JB7PApcaU+xANZ5DHhqBWhLgePJY6X8qba79BE6eduOlMiGQp6xMZeTqJm1du5NIvbD17uMzJIAmluep7AgBm5gWbRRVSo9C5Qa1NYRIAB4ffaHyJax9+tvsiWxsvM3J2LTWWwb1ZRvQiXaxThzmfGoySdgwaDl5U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=YePzFegg; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="YePzFegg"
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4ARof1259433
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:49:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=/o9H5FgasefROxqKDDEdYAkxJXhkPzeFoMZASp4p/7I=; b=YePzFeggFfd7
	k0G+KkznX1KeDWbi5eIpQTnUNjRv2n7oJVAtwKTw1gifhjyAZ0HP4YRUN3mcDphb
	Fxq1wJ1wBZMWf6ENu3vOFK5LY7b4Z4lZo+S98EB+PwKR7mKr0ANbFVv36g8293HK
	hbptH1/YBLN3FJC5SedwuuNNYTBZ30RNxAKqbHBKezjejTScQKhtcGkjCITBS+1F
	v5s+atDbjzbcxIVd0Vd1VqkI3fBLybqWysOw7peC4SgC49z+u+qswIBh4X88RKf2
	aTiVzV+x2TSUp9rVaeTGVfFdtUHZOGWMqWyQbtZ5sDOnjpZoRR1BWwxdgofBywiB
	Tzyuzty64A==
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e7a5hw09s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:49:24 -0700 (PDT)
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-38e817d9498so13699701fa.2
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779202164; cv=none;
        d=google.com; s=arc-20240605;
        b=IC7ute8+Ri6Pwt1PACviMtTLhY06mZ2PyaxQxf/F1qQGoc/BjAf7olFalb5r1hVdm6
         9FiEhFP4AMAF8V1VcJXwlResxBMYLvxB5sWMWWHmuv/iWtCYu9XJIQKBxthWY9Gw/Xjs
         16Td9yyqeRzTcy/fk8VbsH8tjJm6Cqbhk2pFKXbXhePKu4QHJWMkZAMuAOV35QtUslg1
         2o0I+aIzZpl3lVrVaWQT8CI1Yfnoie8dKf6xg0l2dZC20HFjd/1TdxMdsERYOHFDxVgc
         bx9Yb4yHRCMP68tBD/wbjzq7kYiaEMgBAaey/WRCXSEL/HMV9f/EQ+I4qTqTmVurnzQr
         fQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Ib2qdk+Mk5YH+ZIlxpjXJU9f13XhSARCz98MHoIpCJ4=;
        fh=qQNiFKpP5tNiKkTXhgZjYmYvox9v7y/248+fn7v0TA8=;
        b=h/RmnR5W8TUSz5EArDnorPl0FM4zGGScv5JhkPmIAhxl+c5e5fxuu858/0NaJAQgzq
         2LwlI8aviVeifgNq+EaHhwMcsQhpAB6BTFBQm04Ym91QakHy1H373qkvwE1K5oQqeLzx
         DUxqTpuzqTSC4k+v+EwMAYxdMvXPixBK+ilwhPPrqN+wSPo3CROsFef8du3AWortNbUC
         jiM8Y97T0LScrUFHXH8TQzEi4WdBfPsoybOa6Q5hn4ADXQJ6Gb8Ck4E31vfrzYZ28t08
         o2NCjpOzHsRil12PCmHgUMNOVVsLc99UvgYsCNbniNSTHojfKr9iRrArgT4nI7rS9jxU
         4QXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202164; x=1779806964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ib2qdk+Mk5YH+ZIlxpjXJU9f13XhSARCz98MHoIpCJ4=;
        b=ZxT351ilbsa9fLaAFIMa/htsWhvjHhSvR9ThzIlvDAK8W/OAXJnMYbqVvHlAxKXMLp
         jXpiK6dAZmaj43eRavx9MuiN3nXVQh19pByGgnBrvpeMfDwwLjNtNeRPC5+ZOAq11jDB
         BaU9k0ly7HgTiED8oySxgVzw6xA7WCvMKxaGKAjMuXUEsS5gHp+/BdtIEJEi51WKX58w
         EfF2lV7oqgeHPndJqCya2jy1KtxvJcmQYLJl/LUznE2QZDUDN2zyph6V/SJT/UKLmWDs
         0eZdX7KERHFJockdCJEjSxHoVcSzMIBtaklvQPf+EzMaPx5r/lpXw9mq4+X982tIZgKp
         EJ/A==
X-Forwarded-Encrypted: i=1; AFNElJ9BwFocpEPhgWVJT+FE07SjkAjdsah+AWXZcxJ2za0t5TgrSzwN76QBPa3tTGF+B6v5eNUk/u1fnM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK2LsDVegGNwgkigU5gUTrbnJR7xb6LBmP92zm4FiQcKcS3pH
	ciYElHr0HPLO2B9lFOObBwn8cOlz/iD2PBcjwWQLukGV7xsq0arucjHKU45MFPvYKm0p7tcSCXW
	wgqrdQ+MsOlAQlviRBoBJDN7V/ByQ/KFg4t6Ok5xn3c6TNLAskkV+KSu46cX8DTE3uU00AmtoIm
	XBL+kx5Yp1Fo0yO2HjBhqICfKSa5VbYZ8pLFY=
X-Gm-Gg: Acq92OGUe+9Z6yS0gn5BNDCuNFVrGirVqtV07uyytJX/LivZzjR4JpVO86aqjCewPfs
	tI7dx8BDFRaBV58uhwxL7kY8o4LylHQOktcuZRxYh1FK8lwQuHUSU+yYlfnzkWK35+JNyA60OjY
	S+LesVh8Nm/y0tuZJH8hnudK564sia+kwdG1P9PSg6lpXQA2TCx/vryPn2FE28llGxqLldZ0GSJ
	I1MvY2dtvBXi66U4peCD1Pky8CXsxfZxi/unBtM
X-Received: by 2002:a2e:a016:0:10b0:393:e33d:b710 with SMTP id 38308e7fff4ca-39561c68c05mr42739501fa.8.1779202163654;
        Tue, 19 May 2026 07:49:23 -0700 (PDT)
X-Received: by 2002:a2e:a016:0:10b0:393:e33d:b710 with SMTP id
 38308e7fff4ca-39561c68c05mr42739261fa.8.1779202163019; Tue, 19 May 2026
 07:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <CAEmasaV7ejxqb9-wTT=7xdt+icxj-ZvdSLkSoC6X5i6NMfsKPQ@mail.gmail.com> <tencent_BE4D8C052157D1B38BA2F9FCA287D4C8E606@qq.com>
In-Reply-To: <tencent_BE4D8C052157D1B38BA2F9FCA287D4C8E606@qq.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Tue, 19 May 2026 16:49:11 +0200
X-Gm-Features: AVHnY4JC-rFMG-t67F0OvJvbLZscwsKubCWhiIUmHOgFww8k8IsUXBZ97bNRJ3E
Message-ID: <CAEmasaV=L8w4dF7ja7GkDu_7U5i+aVVH1a1qsXgtFr3wuWNOPA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio swapin
To: Fujunjie <fujunjie1@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
        Lorenzo Stoakes <ljs@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NqXhtcdJ c=1 sm=1 tr=0 ts=6a0c7875 cx=c_pps
 a=7DXwzBV7yB9sQ64fpm0YNw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=UqCG9HQmAAAA:8 a=dZbOZ2KzAAAA:8
 a=xaCPWuQt8fWdwKYzCrQA:9 a=QEXdDO2ut3YA:10 a=eI3u7fyX2kwyfkukwWva:22
X-Proofpoint-GUID: vPMlLok54kPA9UgzqUfmgSqaMpa5YS5O
X-Proofpoint-ORIG-GUID: vPMlLok54kPA9UgzqUfmgSqaMpa5YS5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0NiBTYWx0ZWRfX1igPppoOxiN2
 jtpWn5JNdktK0wPmqIw5V85JHqwNbxRluL67TY7sNbtUFHTHpMhJNu7ORukAsNDuZ+STdlNEwUS
 61o2a1O3DLVJpTdr2H72kIJmb6xaQATHzwwkp73fr6J70OhhSN2YVQkV2IDh/gs50+FxMyrbBMM
 36f74fT4SAE9u2yt1NJuTMRvLXFmtLyCjImRd12D1CqvIJ3+wp9MiIursBJ8QfGqmMjOcR4lQW9
 fUW0NTHZA6rlDHpbxyX24NW2ztYqzYqz7Or3VYieMXL2S9kGww9aFT8UTNmKcmrrD//BY00V2uM
 yrYY1NA0uhu4D/Zplv3dU8QfvJek62+Ricm/1DZlcrHJz4KEJbJhunZfOsEjaO3TI5QkA2+bnxR
 rMApnHeGczxVcaNwQf2sBQvz46tPpXy0mG2Ah3qD9OyG4fX1HKSDUu3/wHzeKJQ0QSOMUPTXxd6
 DPOIeruxLGcVMQd2LEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01

Hi,

On Tue, May 12, 2026 at 9:46=E2=80=AFAM Fujunjie <fujunjie1@qq.com> wrote:
>
> >
>
>
> On 5/12/2026 12:20 PM, Alexandre Ghiti wrote:
> > So I have been working on the exact same thing for some weeks now. My w=
ork is based on Usama's series [1].
> >
> > The problem with large folio swapin is that it can create swap thrashin=
g: to swap in a large folio, swap out may be necessary, as reported in [2].
> >
> > I implemented quite a few throttling algorithms on top to try to avoid =
this issue and so far, I have had mixed/inconsistent results.
> >
> > How did you test this series? Did you encounter thrashing? Do you have =
performance numbers?
> >
> > Happy to talk more about this, thanks for your series!
> >
> > Alex
> >
> > [1] https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif642@g=
mail.com/  <https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif6=
42@gmail.com/ >
> > [2] https://lore.kernel.org/all/SJ0PR11MB5678A864244B09FDE4D914EEC9402@=
SJ0PR11MB5678.namprd11.prod.outlook.com/  <https://lore.kernel.org/all/SJ0P=
R11MB5678A864244B09FDE4D914EEC9402@SJ0PR11MB5678.namprd11.prod.outlook.com/=
 >
>
> Thanks Alexandre.
>
> My RFC only had correctness testing so far. I tested the all-zswap path
> and fallback cases under QEMU, but I don't have bare-metal
> performance numbers yet.
>
> If you are already actively working on this, I don't want to duplicate the
> same effort. I will pause this RFC for now and wait for your series.
>
> After your series is posted, I will take another look and see if there is
> anything that still needs follow-up work.
>
> Thanks for letting me know.

Sorry for the late answer. I took a break because of the inconsistent
results that I had, perhaps a fresh look could help so no worries if
you give it a try on your end.

Happy to discuss further results if you continue.

Alex

>
