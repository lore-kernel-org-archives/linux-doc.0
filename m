Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72368548E1
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718774835; cv=none; b=oz/a/65Gz0bZKUZRLAfjFVp5XW5rLtPe6K5J4JQ/fZH0wVdW6NFTQqKOX19sWx0nDWC7k2WjHJzZiS7sWdaVwJeW8/BDDdhY+YUE0ek5D9Gecg7ex5/Q3iG2dTUTNi5l8ChwaR8Pw126I3Sg8TbCmn1Z5IpfqY97gal15LkJYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718774835; c=relaxed/simple;
	bh=TaldpaFdVU9VKO80EHQfPadmZ9ehSii7vDuV8VjyxKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdBHOO/d5ued9Z+FJ1/HnI//y9QBAnhR0hWyiLuJk/jYYyx5vWzjosvk0CM/jqO8Tnqz7sV7x/gsTtHbIKeGsrvlFxQ13u4/FG4zZ8M6XA1/o2VSN8sNrPMgmLkOjM7GFhmtE1ce40BhHVnMd0i3iLsv7jatc43FGbLwNsxpUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3xvDjMUi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3xvDjMUi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3626c29d3f0so868858f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718774832; x=1719379632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMKzlr4YMJj/i6AQp9On5aFVd7CtHU1kUwtqMK4CQp0=;
        b=3xvDjMUigsR4c/Z4Ic5yt2d4G2yQYON2CtOE6OC2V6pEj5JfZdXq3RKbcUIUh/xuig
         2H5jRq8/9irM1fJzA/VUpt32Q7YJALsKtYrngOEgQ33zKgk4x1LqbgjsInehC5RGvgV6
         H3JJE+JtZqjxCm+vapN+9AKCnwj7neGxcudTxHZSNfLyuL1IiNpaoKWSYnohXfqtOOmd
         0eSSk6h8G0bW2c0KVKggkSgaGj4QxKB7Xas+7OONcAdITCwy5gVDANI/8U3y6P7+rf/Z
         ODsY4o+IEqWxL0Zvd++RG6HrTEInx2cPx8TeVBWkjX3PbyZTAzNOBpUK4xTBnX6Kthq9
         DpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718774832; x=1719379632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMKzlr4YMJj/i6AQp9On5aFVd7CtHU1kUwtqMK4CQp0=;
        b=RgeZv+kWAb6kdfBIdBgz2y/APap9LsP0maDdTf/r6SAGNTdVcAcukPWD7kBvrKuDXP
         nip4figaAv2ZqJzcEmHeXPz7W/q58pzJ6BuFIaakvNLhja8g3L2XSvQCjKF76JwHad1e
         Nqgw7cRAQDh7TjxX+od7Ey+DQySdQyNYTNC2TSAidHD+yMlLe3j/K5/XxRIUxo6LAJl2
         I3BXab1MGM/2GK+KUzho3+DmcKnWVeIdHIkMtYrnZwKWsFTdvZKcD8XGWpaKXT/Otxhu
         cF9rBc7Mbvx612BIpzvuX22CN4gnLuafcW7JyQ6w4lCh2+8FW9TEU7Th45a+rkYwenp6
         eniw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Owt+6y4fGKBs1lcvAo2qNtEllwQNqCvby5FJRLMcAKwomHazm3gNRSI6kcZyDWCF+lAyzf//rOfaKD7ND+lc/OG1RDKRc+46
X-Gm-Message-State: AOJu0Yw9MdAe/79vrZdLlfKIEo8aPOtN0kL0bh1leqw1jescIv0NroWZ
	l+s+uezkHW7BtObqG5+VpBEflGwvM9tJqvZhcgKH3czdkshCNhiIkOn4eDcEr3bo66iiUjRtb1b
	6u/Fu0zEfTpWl5TtAg/q9tv6lgVciKceaQG61
X-Google-Smtp-Source: AGHT+IFJQWZ+KHiN/+sHKwZP16by1QOEq1WGoR1DxEL2A3UFRInhIe7af0qptcWZ7wTRqX0VaIgipvW1b8Mme6mmrZQ=
X-Received: by 2002:a5d:69c8:0:b0:35f:2635:5b61 with SMTP id
 ffacd0b85a97d-3631989352fmr1085996f8f.51.1718774831425; Tue, 18 Jun 2024
 22:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com> <20240617170545.3820912-2-jiaqiyan@google.com>
 <ZnJmsqvJz63imq3O@localhost.localdomain> <ZnJo73kZk5EDxq0D@localhost.localdomain>
In-Reply-To: <ZnJo73kZk5EDxq0D@localhost.localdomain>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 18 Jun 2024 22:26:59 -0700
Message-ID: <CACw3F52X3BUCeB7OUhbEzEHy7y2vdNO60pybz2x9OdhyZOoStw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/memory-failure: userspace controls
 soft-offlining pages
To: Oscar Salvador <osalvador@suse.de>
Cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
	shuah@kernel.org, corbet@lwn.net, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 10:13=E2=80=AFPM Oscar Salvador <osalvador@suse.de>=
 wrote:
>
> On Wed, Jun 19, 2024 at 07:03:46AM +0200, Oscar Salvador wrote:
> > On Mon, Jun 17, 2024 at 05:05:43PM +0000, Jiaqi Yan wrote:
> > > +   if (!sysctl_enable_soft_offline) {
> > > +           pr_info("%#lx: OS-wide disabled\n", pfn);
> > > +           put_ref_page(pfn, flags);
> > > +           return -EOPNOTSUPP;
> > > +   }
> >
> > We should not be doing anything if soft_offline is disabled, so this ch=
eck should
> > be placed upfront, at the very beginning of the function.
> > Then you can remove the 'put_ref_page' call.
>
> Also, I would go for a pr_info_once here, as otherwise we can spam the lo=
g quite
> easy.

Nice catch. I will do pr_info_once in v4.

>
> --
> Oscar Salvador
> SUSE Labs
