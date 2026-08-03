Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78A42EEAA
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784484; cv=pass; b=m3H29sfGfVFdGilFnlAUuINa8BZi+5GU145UPUkb4gi4t5VcqmfHXKDKJu9zCOHTiPSTik8wPIQfd1ij/Ox/SZCByLfJISwQ8M0qv5FbJ3jzW1mA20BmjnI/eU+PuIPNb+M8t3iuafcGxG8tpg4ds4N6TCiGa7bpiVE0ffTCBYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784484; c=relaxed/simple;
	bh=sFCOvtoauUp0lPup9O/L6aTIGadv/DlabnBNvw2W3fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOsV15sps3MtZxG18U8rLhVECRiWDYhtOsM5DJLG4T80LvOCcadKw6cwMT84rptVqNjBpZR++AzR6cC2uyi6/LuTBVezeoSfkGKdsFQFLhXUnjFnoWKdN6ESdUOhfKa2p8x204C9CFttbvDnkq2zyXhlxOznALUrGek3wOstLCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWksjmbZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C0/wWelm; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWksjmbZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C0/wWelm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785784481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXxSiWzPd5q4+tE4Go+M+sEFvuFdyjKmZYx3+a0dZSY=;
	b=aWksjmbZRWEZQN4WuoXbIE0fupc0wO1kv5BOsgU9wmpE50/4GblbTCQMV7rZmDT3wcfrhO
	HFHvpi65HoqlAXr0iAYv84ebbrDFG7xYRfI7KLPFI9TEv1WO30id0bRhj12gjUFTJQP6nU
	tDwhiqTPw2m6aQRi12W++beaky4blM8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-MKl4UexyOMmEo3maTc35QQ-1; Mon, 03 Aug 2026 15:14:40 -0400
X-MC-Unique: MKl4UexyOMmEo3maTc35QQ-1
X-Mimecast-MFC-AGG-ID: MKl4UexyOMmEo3maTc35QQ_1785784478
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39db6f712b7so21508821fa.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 12:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785784478; cv=none;
        d=google.com; s=arc-20260327;
        b=D84UqwG5aJLJsJ1IyGHqagkoWdWDLju+c0nCLjVUaA+5Hsi46vyqENLIrGZCdM4PmY
         0vqX4LJYOPMeBKzonM+5WKlFI5JeRleCfpTx2iUBE6AevaVLvNWCLHlLUko65oE0HRWe
         iGISYtAJxjIZ3jefscY6zdWz+uC7rEbsiYHtyPZAB8d8bYt76flw43T4xaWhsz2ofCUL
         Z/CnJBMw0/zfsPfu2n1plKsaTDh367aHZW5yM81m7HDobfyrm06Tbge8QaZ/eqLzgzes
         tLF/FjFiiGG0ebRvwBiBbUS0RxfV3LEKCeHgsdRjxMKNs8XDn+KoelcYhcfDnLwnfVKZ
         Ei2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DXxSiWzPd5q4+tE4Go+M+sEFvuFdyjKmZYx3+a0dZSY=;
        fh=4RSoz5X5Tb+xT4laYZLGRbiMF2A7bwHglwuCAqzJea4=;
        b=LygRwaLb+epU0NbBSr5bNjHsfEILn/rF4QTNCld/XtPxZlS8piJKe7RR4x7SlaZHsG
         gAM55KUfu1uKfe5Xb3DCCf2mxrup/PULXHdK9tmSHFyYeodI4ss/5eNjr5YD8souCBtj
         DfvWf4ZuhJ7XtbZZRKcLxtJk0LypqCVnAzR4g+whB8/RvX1ZX69fMFnm95QJkLh8oba9
         Fh0O4roq/RPL7rW6g6/4bONjedwUUBkM3qc8UEpmD5kfnAEtrZOj5HegNWR6y7kCDDGi
         RucaiSWV5z3KovFJ9jv+3GiYWtGq46H6XKPEkrv3VZ/ZH0KMxoVlM2dSmOKGzix4Le6a
         khvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785784478; x=1786389278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXxSiWzPd5q4+tE4Go+M+sEFvuFdyjKmZYx3+a0dZSY=;
        b=C0/wWelm7Dia9BiiPh/bfFDHuGxE9+lEwLMo3PE6jstDSOAoGi+MRlkAzg1ho6RuLF
         F9e02Pce4oXEduNGdaj66P+8AOUPS7tpurLUneXHX4bJ1WbKhY9eUe3PCS1VElkJ0T9R
         8EaGKz1Cf6dTsGrpx1qjqsWQ8rXDJdmv+JE2Tb4N0iI50+etHlDKW/a9jWSdCjSqFOPb
         7ZIJiAbK31vNL937044BqZOXEVYZnAo+RXJ8CwvzW+uUiW9MfCvFXERkIh2mGeGi0Avu
         /B4orW80O4hoPZnOpDjU5lxIgZrKi1HyGV6ngmIebi69eNMOkIhoc9NG1AdE/gnOfVUl
         MJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784478; x=1786389278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXxSiWzPd5q4+tE4Go+M+sEFvuFdyjKmZYx3+a0dZSY=;
        b=bmeLFqSGBTwuyWG303di2EBCwjkG75AL4+bt6Tz2dlcnkVFRl1y5XOhOsQcpMoHKk7
         Po1iUMhOPmnIvIfIXkRJjSi+QLsfRBcvIOwrzO71Irbe2130cgR1xvDyt3IdhsZfutu/
         nPsO1ysUPTXKCiQFC8pkpFYC8P6SZxawYvIWJ1T6+fD8gLuUOWMAf5/cSohvydF/t+Pu
         YauEpdLiGXNUmoXUZemiH3CXOnK8GQzi783YjbaNqK0Oimb5IU4e3jWhzq7CZFW3u8r/
         x5mMJk+Z7y87QGm3hmWoyF32dydiROHc83nRneajEYPyMVdhKoen9O0Eo1o2A/LpjwWB
         2pSg==
X-Gm-Message-State: AOJu0YwJBC5AO/MVmWw/1+NzCd41O6Bjdne1Gyf+mOHDZROhod2VHMTn
	aBPAH75/Y+zPO3FaHFpoHHiQIoublFIaHucEt5+oyDp93UEIMjtwB1HXyCZiRf7aBSOmMtHk396
	Ev3W6yg141oH7a0r/PIo/JP38x++K3tPlqVJETV10YgbX6NSNJZ3SZvW4k7FgepvHNx5LFt0cjo
	q8DZjuVoKPK0ITzEKz0RlWBumsfC9TzX+8H93o
X-Gm-Gg: AR+sD105Ug9yFsVIS27lqo87VFdzYRRlfXwMbPcBL6RbzC7au9ydKnzxrWLLZbQX1xG
	4kCkF92c3Qx46Kgdy7QqEY6R0QK3AZyntucGDEvvI3R1hjFnjQh6IFNR2Y5tDTUbUa5ZKk8U4+5
	qVhw8aIif69UXlzDzbV/xNoy/oIy1M8EpwwdM3+0OvrpursTKQyLG8BapUmg==
X-Received: by 2002:a05:651c:a34b:b0:39d:9dec:2494 with SMTP id 38308e7fff4ca-39f864623c8mr20316811fa.36.1785784478344;
        Mon, 03 Aug 2026 12:14:38 -0700 (PDT)
X-Received: by 2002:a05:651c:a34b:b0:39d:9dec:2494 with SMTP id
 38308e7fff4ca-39f864623c8mr20316691fa.36.1785784477930; Mon, 03 Aug 2026
 12:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715025941.1571316-1-npache@redhat.com> <20260715025941.1571316-5-npache@redhat.com>
 <1e2e464b-07db-4fa2-8e38-2d73a9eaea07@kernel.org>
In-Reply-To: <1e2e464b-07db-4fa2-8e38-2d73a9eaea07@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 3 Aug 2026 13:14:09 -0600
X-Gm-Features: AUfX_mzpgeololY3myjbblsVFbE08PdKDlfo-6olNhWKvA246eL8HAmCelZ7BnU
Message-ID: <CAA1CXcAsh4hOSsNbAM8MKcg1k2q_XZ3kxqiE6TpWddrSbj_soA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] mm/khugepaged: fix outdated comments
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:45=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
>
> >        * UFFDIO_MOVE is prevented to race as well thanks to the
> >        * mmap_lock.
> > @@ -1643,7 +1643,8 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >
> >       /*
> >        * If PMD is the only enabled order, enforce max_ptes_none, other=
wise
> > -      * scan all pages to populate the bitmap for mTHP collapse.
> > +      * scan all pages to populate the bitmap for mTHP collapse. The b=
itmap
> > +      * is then checked again in mthp_collapse() for each attempted or=
der.
>
> Why use () here but not in the other cases above? (e.g., collapse_scan_pm=
d)

Ack, I'll update that! Thanks

>
> --
> Cheers,
>
> David
>

