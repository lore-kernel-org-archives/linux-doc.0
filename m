Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0E4048A3
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105311; cv=pass; b=GtKEGc9Hugc3Z/pKMrGgCbpPYCeJqUYKCFH7TMXWuszNx9g+RkVaL3wzDFwHQzfmBnLOrUAiiceFMa+D0xCRWVy04UB3wo1xBURQxB9rdTnKs7pCR5wpRIj+CPFU4I5QgWH3o6w8SANaeUUee+nHXh5gs47+xpFs37uJKsuq0ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105311; c=relaxed/simple;
	bh=t/n84oizsmqf30Qmzu71biJDzzYUFf3OYTLdCk6ENu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTt+fto9DO49Wl5mRSSjpR1q6O2BllT6OSAVBsZcvU09HQIyLrpK1ad/8hJXI1NgBYen6rBzMse36dBBpVC4VJcNRtnUMpQgRRpY71Mfi+Ht+7SL7i8Ae4d6AADB0asGWYjACgXps3h/KHgQNHahe2CD88W8a+ISYRx9mgGSf10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDFFpk3l; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDFFpk3l"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so450178a91.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 02:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791105310; cv=none;
        d=google.com; s=arc-20260327;
        b=IIxLcttQufxci98L2Lw6N+8/SWrfIZNMA2Q1Jh15V06P/3ubFYp2YDDViJnOw/PKN+
         fKEFQXMJny8kTF4mIrbAIkvaYZm/QN2FfFPieGS3T2a5GqyQeeDc6On6ToW0gvdgw8l3
         OtIbXDWnYLooDvCit7FvpWzpq9CEb4o9bhcbxTDmNo4kgfOCfbAhN3FM7RxVaJ2hg4bV
         OfES0pCvr5tqaLS1gnrtXUx+7bhFGTEsQv7Yz3jCoDS5ju5xowFEvHUnlF9BcvMgSemg
         6nqHNz5VUsLPPhPQ1Fd5N+Q/G24KfqAB2zhyZwMOp02pWJaVn+6qIfvGZg9yY8ZIeuHF
         eguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        fh=Xba3Rt14SPsvgKL9gslqVR/2XsptQwEcqgHfXC9SlCM=;
        b=IN02HNfRyC8ia5fOPxqdHlBnhmPk1/NO125syqbOluojV7DMF4tBU9A85LyoUE14bK
         /xBSaNFcgiNcSm+j2Tg94qJUIbnUxR+FT+fQcyP7ltna6SEBgy3hXJhzpJWEL7MI3y32
         l6TfQhe+K0wxHB5cv8qaWhApq0YAmGCHqkkZYB1syJykCfdgg4m/mt0jIkk79g6qZpeV
         LJVryuRxpdhU/DNn6mn9Z73wUKgVSaOQ0TLeH8YvJdnHyNx+kSLf8VtDfs844GynmX0F
         FcjM59/PYCvm3VXxwqhKK8AfmBOxk+uFlytCfz7RTRT4zA+AeYFc2j42ncM9n5PGvGZ8
         iivw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791105310; x=1791710110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=XDFFpk3lPoJkVJWIf1wXLbSoEYqk9fpO4H1N+Fudy5xgeOHUMsLPvSZ+L4U39y+wPY
         urxf6CuDd9dMS20bIG3ZwnPehHVUcNquv79hggpTBcmM5ZpwW+nCHAkaWy+4XGZoBHMO
         4R2GIXs7LWgUBgHf+ZVe8Nz1lrKgCm057DopRvVzaLb1JqqQPcNvW6EDP2VFesftZP5N
         TJNde97Fa6D5E9fb6e84rnZDF6gWEkdlpc/tgPAZVz5HLkYJot94YfakfvbfeJikINkI
         /4eXxy1/AoRtjM876zUIT8VS2y0zoGrF33XMVHpNxsSYeLhaABeZRJXwRnstDbVNzHM4
         GYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791105310; x=1791710110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=UmukdH/7ttmMHmpCR12XFsEDhZar2EkPfheL33uFjMZqi+3kHBviUDFyOHzGKE7ozq
         ZLldaAuURms520v+rf+Yfj0Tyip7yhPEewPwXIhsP+TOnnlmjbtNLx4N9AncAfMBIP5e
         XkjW8aYSoZzvRPz6qL2G1o2PX7LhummtPvdGkVnznrIGwqx0jSt5yZyKAFRsfcx+0c3o
         +USRiS+tHeYU+k8p52zDz9vUIkEPLR7VNHAnrquS1sf2JCKMm9ulfcHMtgMG+5a2QUp8
         cblu8jBfU40Jw6JnJxkpTPqQ4nkrXAL5mrX2hOOQYTNegJBCNmnvj1wBprOHYEer7cZh
         KcjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfP+6jD18X2xJPbgtOiedtLOacIQ3hlcxgmNghlUvPERlIcPQh3HEbXP8uNSaJu3FW/17ajlywURY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHzxY5/c48q3goYoXT1HVBe/Uc2G1fcPSSYqjVupJMSrbL7FWE
	kK7U1WogV/CoblS58dAKpxnhMe8KFk/E8Zu6XE5J320/JHUmq2I1hDPdErvHXQr0dV/6L5GovMG
	bk78NBq6mLYjr9ANL7C+r3Xa8daDGRNU=
X-Gm-Gg: AYBFou38eO70AjiJeR0oaL0jJBBFlV4VwXWHfSBWM8xbkUKtGAxU7qHVC18b20Rbjkm
	P0O3yUNzvhObaFzUC+S5wacISM9eSCCoSJ7Dx/b5qU930qcqirzJ3NYnwS42nOEtdRfjFmuwxQp
	60dRLZwj4Nr3eianMN6kO86UuACHTghwCFL8tlRQboISLvgP6wbZOfgEHMZ4U6Ro7boUoLOryGj
	CgNr8IGwSEQrORhAr1rEqipS2r7CtVKwNBhZkcFJmilcFRGnzaZk5pYlT/hLBWbOuflZ3/Zmtxd
	sUpy6Twepc1j5ItAAjO4OMgYXd3PrUIU2Ao9HAYyv+NXbSeW7ZRapg==
X-Received: by 2002:a17:90b:2548:b0:3a0:d651:3957 with SMTP id
 98e67ed59e1d1-3a7873ac66fmr3158501a91.35.1791105309539; Sun, 04 Oct 2026
 02:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-2-lrizzo@google.com>
 <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
In-Reply-To: <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
From: Luigi Rizzo <rizzo.unipi@gmail.com>
Date: Sun, 4 Oct 2026 11:14:58 +0200
X-Gm-Features: AclHuK-h1jLN5HUM25V1KDJrvXlK_1XFkjlYVZ2OmcSjQmXYi39ZO7A1D8RAYWw
Message-ID: <CA+hQ2+ieCiXpnRzv7t003cHKG-YL+jSOSgVO_KavGEkbKfOeuw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 01/22] iommu/dma: introduce CONFIG_DMA_PMD and
 metadata table
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Luigi Rizzo <lrizzo@google.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/3/26 2:22 PM, Luigi Rizzo wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 6e07bd69467a3..1bb347fd9da4a 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -158,6 +158,38 @@ config IOMMU_DMA
> >       select NEED_SG_DMA_LENGTH
> >       select NEED_SG_DMA_FLAGS if SWIOTLB
> >
> > +# PMD_SIZE IOMMU backing for DMA-coherent devices
> > +config DMA_PMD
...
> > +       Costs 128KB of metadata per GB of DMA_PMD buffers, allocated on=
 demand.
>
> Paragraph 1 of the patch description says 64KB per 1GB, not 128KB.
> Or am I mixing things up?

256B per 2MB page, 128KB per 1GB is the correct version.
The number in the patch description is a leftover from an earlier
version, I will update.

cheers
luigi
