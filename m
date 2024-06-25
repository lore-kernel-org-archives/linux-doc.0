Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD016DEA4
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330543; cv=none; b=RLbtUZ7Y7sus6Z2XM+yXyvvdi+jIr/gnA5o7dBLHht4PYWZpThTPbY+vlcsCMnPY40gJlyL0VVI/rbGIPcIWC9+IxVDpmeqIYRkXS1vos/IFIUBlKrRlB5yFvfmucZl07Fs5+woTYQcRtFyc1O7qjCMCvyIYNV3PnL2vrH2CTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330543; c=relaxed/simple;
	bh=IQXgv+CoqziIu1jPjhD/1Hlxn6w+ndusTZW11A0npas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzOceQSX2wP0mfCPSTM6jzcTATYqzhpFfrzxN9Bey2WQvslNLZ5yqsblxJjLdQ/T1pzKGZimJ4Au4aDnlBKSlcwpnUgzrEpObWv6+Ex23+GDX6qUa6NdHYdyJBSybGEpqjMl0CBocEsLDjqZkRgAhQydxKdR/SnsHSVmOJQ87m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWjJ8xT/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWjJ8xT/"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so4917978e87.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719330539; x=1719935339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxb67F0epg0WUcpjIVopItAKW3yTsqHV0EkWYkb6TKU=;
        b=fWjJ8xT/ZgCPmsx5P4hQW2ZWy7c3QxNhc8L8mG9aAu9t31mtKxoZsmpbgZpdxspK3e
         KDDnmWfJl1wH4Uzrng+XAsJOXjFzu9coweGMElBQtIRMcWCOeyBqbNXsEuM+9SszqEj1
         7tOMXPmw7Upvf5G7F5wuTtUSymXMoiJ4ie18yHGmyxTxNcs2yJTeEkuBqUu9O3xv3qbh
         /e28L20CR7q2gFr6MntoUuwwtCjw4KaS6crjHU2yBLsI1XetQOCrYKalzvx7spiyt+5+
         ZEGKBE7JRbAQxpH1zBCQFeIo+Ww8fPMT6U6LZ1uoayzoN+8xbsrLy87W54JBnm63ny82
         6xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330539; x=1719935339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxb67F0epg0WUcpjIVopItAKW3yTsqHV0EkWYkb6TKU=;
        b=tfL9tL7paDe9Y/7ILoILoUn4pPqmUj7ij7tVt1gZGCEZ1jQpYPycfdsmLZyWopBQh3
         ojOMhh7KgEkcCV/Xrg7PuMqbw+BRUrNvDOhrpDE+h4xuY5g/L+pbae3A2sAK9D6dPp5l
         XhwGXKlqP3Yw2vhPXaTux+vP6YkXzqOct0zXFvFlnAnqbQ7uRtJN6aAQnHTnrCwliHpg
         IFNGa53mcci+XnOdxQKIHeHvcSmkfeWdFn0vsOAdKtEkvEk1MJob6iERlV7hPpF4jKLr
         scmiCk4ER5BtoQPxSGjORHUfFxIiZh/ore6aHDRGOysT8FqzRj8GTyd9lD4QRu+9Kf+j
         95oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVioCHsgrmd45hUfZTQmuricucfui7WlhqQEC9R9jPjpdQb4eOeh33fY6hT7RWkrYXrPeNXC/nU4cH/Pz7mjEZWzRiRlYgLC9UZ
X-Gm-Message-State: AOJu0YxMOXXKtOITSRvkkPEyvDiW8cxw2aqMdTGu0sQLZ/pY1piQOQ2a
	eN1Jo2RoI4XvDewGNRzQV70I500aFccHu70l6FS6wo0eUVlC9cDZnDZYWzRE1nTnD81ETdP0oMM
	jxoFV2Aeiu1COcCYzj+hI2p8jtKPO5zIfGgvR
X-Google-Smtp-Source: AGHT+IHcWe8Q/heq47iYVyRVbt/goSPcjLABzSqKs/piB9Ciz9feIfIDC39cZFwoe7e1yt7HahE0jpTztGd58ymd0zw=
X-Received: by 2002:a05:6512:348c:b0:52c:86d7:fa62 with SMTP id
 2adb3069b0e04-52ce061b1femr6166980e87.23.1719330539167; Tue, 25 Jun 2024
 08:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624163348.1751454-1-jiaqiyan@google.com> <20240624163348.1751454-2-jiaqiyan@google.com>
 <b669e378-45cb-981e-ba58-1e3c4943577d@huawei.com>
In-Reply-To: <b669e378-45cb-981e-ba58-1e3c4943577d@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 25 Jun 2024 08:48:46 -0700
Message-ID: <CACw3F53H96xws-ZHacWFbDt=YjaKiGYKRMwLJkUe+pUPGy_M=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mm/memory-failure: refactor log format in soft
 offline code
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, nao.horiguchi@gmail.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:41=E2=80=AFPM Miaohe Lin <linmiaohe@huawei.com> =
wrote:
>
> On 2024/6/25 0:33, Jiaqi Yan wrote:
> > Logs from soft_offline_page and soft_offline_in_use_page have
> > different formats than majority of the memory failure code:
> >
> >   "Memory failure: 0x${pfn}: ${lower_case_message}"
> >
> > Convert them to the following format:
> >
> >   "Soft offline: 0x${pfn}: ${lower_case_message}"
> >
> > No functional change in this commit.
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  mm/memory-failure.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> > index d3c830e817e3..2a097af7da0e 100644
> > --- a/mm/memory-failure.c
> > +++ b/mm/memory-failure.c
> > @@ -2631,6 +2631,9 @@ int unpoison_memory(unsigned long pfn)
> >  }
> >  EXPORT_SYMBOL(unpoison_memory);
> >
> > +#undef pr_fmt
> > +#define pr_fmt(fmt) "Soft offline: " fmt
> > +
> >  static bool mf_isolate_folio(struct folio *folio, struct list_head *pa=
gelist)
> >  {
> >       bool isolated =3D false;
> > @@ -2686,7 +2689,7 @@ static int soft_offline_in_use_page(struct page *=
page)
> >
> >       if (!huge && folio_test_large(folio)) {
> >               if (try_to_split_thp_page(page)) {
> > -                     pr_info("soft offline: %#lx: thp split failed\n",=
 pfn);
> > +                     pr_info("%#lx: thp split failed\n", pfn);
> >                       return -EBUSY;
> >               }
> >               folio =3D page_folio(page);
> > @@ -2698,7 +2701,7 @@ static int soft_offline_in_use_page(struct page *=
page)
> >       if (PageHWPoison(page)) {
> >               folio_unlock(folio);
> >               folio_put(folio);
> > -             pr_info("soft offline: %#lx page already poisoned\n", pfn=
);
> > +             pr_info("%#lx page already poisoned\n", pfn);
>
> Again, it's better to be "%#lx: page" to make log format consistent.

Ah, I missed a ":", thanks for catching this!

> Thanks.
> .
