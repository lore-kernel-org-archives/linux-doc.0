Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356A50EBF7
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002525; cv=pass; b=ECFgGkokAsa0Tyc+6A5oz+0XmD3j/PKtxPLlDjgnTKw9ErUjQp5r1jTJjTrGAT6lwFdLfQCYEK6ZVkCsTeNo849t0HgqEfymnNSSwj1N4Viw5l/I1QkMT3vUagU3QMzS1DqmldvVIX7hRPPhW3uj/k2tFRsOMeamXP78SPXFagA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002525; c=relaxed/simple;
	bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1v+B8hAXCkm2haqcv+23xPsH7FDYTjMaeE5GekSwQNTedDvAVvazzmCE7MJbxH9aeb/Ada5TAKMU/BW3N462AGFXMM/tfL43MdAh9FczpwlhnS/hC75VDZQFk4CP/tydRWgmjz1p31TL4aqmUP+miXht2ya36OQ/xCAADtqdfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLIphvaG; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLIphvaG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db33db4de9so249325ad.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 11:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792002522; cv=none;
        d=google.com; s=arc-20260327;
        b=oLnTil3Eu2WXxciU7sxS8z0GD293nIqyIh/lqwQlzPEwHRYd5HFJRDdbBS6iqj31PM
         yVaDz5e+HCezBPCbj79+wkGqz362aOk64wStdi3dpObOvPV0yzmRqV/sKaGJ1E/5ry6l
         EZuIWy7Nc/bUjFTp4FQ+/C3BHL09tRlaadv7xRDvA5YLclMShzyDCSEbm02Gy7e7/0/T
         +qJNsAF8AyVNh3vfQaKgOa5JIkhc9bu5QA/CiTyhlE+yEsvXXBzjwsC0M5tsvv5ZPxJz
         uyPFskpxjcRi3IYOZVmvJjmAnD4NUNT0uKyQB/wa9Mkql5VCJS6DEi+mQyaypd9bk0Mx
         dRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        fh=OVJMlWGPkJsqu3j5kRHVMH8JezTL50Ky1hs9CiAbb0k=;
        b=BMMGEERA8U53h9IlZDhrsXoN2bChUb0oAWCFYz0MnO9iXylIIYOsjGMPlsWcfILmzM
         C62wewrVXqXOGgOsDXuzGmjPxUJ8RgSTyufsFA92iCcRY/jVLit4W2nvsNkZHgOqEl/h
         iQHSS3yOEbWGrqb87TRLadtbOF0rifl4BdHPARmTwe31ZQXQ0A0fCDdwurTiEPbe2XPl
         ykGwM1ZoBdMYtM6Mo/YPa9M0omFDtIw9uZ05sSNk/Cj7ZIqOjpsETqkj0pKnnc+YhUY1
         HkQrTnRGN68Mo45d8HzdON9zeP85o+TBnr3kK88re/0NKuN06JCWK0cur3oAi7XoScF8
         5twA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792002522; x=1792607322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=kLIphvaGvYYPYIvKdG6C61a+6caoEslPpaAMb+3gsBa7eQY0FVFo+R2fR9bci7R2uL
         XhJR4KmL9LSZv+etlVBAFI4/Fdlh8VJSUEvqjvTCv7+CijY1uaSyueH6BXDsuS7I5/Ha
         fNBRow2kNlF+WZ91usyWYfBhsG9EpoY5qw75K/RJF2GaAIlyAr8FVo4j4cB7+3FgmrWK
         snVaeOplsIBhwWgYO3085iKyM5L3hJYIUKpIulW2uH7SIliINVnog8CzcCs+yPiBykQl
         jUMHH1vf8QJz1TalQhB+7q8feCuFzZhkeLQ33v7txLGt0ZArS8GmGMaufq/SLoTkmujP
         gsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002522; x=1792607322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=iq/5VOAaQeM9HSGs2AQtK/YTf3fME21ZgbGuNL91H20bRJQlhwNQCSFiqaXIyddK2M
         5rHfybN9dwzJKwdevZLRBwjsp7V1dNGoIorZdeB+5spcsgOf3tUUOCITCdTH8Hw9/Euy
         dq4Erlz1owb33iCyEgK+4/Jhv8m0zPfm4k8UiEH8w4jthsLIdP0xx5gf+iEBR55KW9HU
         8nAVcEaAy51gTIAhR8LpBtt/xFQdLGvdTK0aHOjVp7mF7RtaC/I3BBwlct/BDCfdwv2w
         TixVqo+nN36vaBl+yohU2+toPZflGel6FnPmNpV+EzKbuohOi5mW+wZ/9SfmvX1b05z7
         N3ww==
X-Forwarded-Encrypted: i=1; AKwUvBzX5etG8iA91Fop6gWOw7Webd92seZYMMBeoZe4fVqF4p/vDwZx7skfzhYSpuk9uSpfp9o0hZjAg5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK/I/y0bkM3CcJYp9NJ4H6x55xCVQXLwMFibTYsSrJIlsqtL85
	zckOHiHafkC89Dzd6AaIXxjhtKcpsKuQIC0Rpz2ssB14w8QfKP5lZR6vlyFd9IqJDOKVqd8OegY
	jP0RSRNfoiEY0+qjzvwT9mgXjywkKHZzxGNKr/bwI
X-Gm-Gg: AYBFou2jZvmPC7nS85c/PxROA6ziPUa2d+y3sWdkr707kek8xvDcB5Z1qPB3wIhDgaQ
	/HW2ZkYJGojwjfwxlPuTxvkeuV8vABpQLD/nBPmfqN1vza3KGd848OdENbL2kMaawN7z0CmRuWN
	49m3KaRtHuNDdil5b2HZ6DsyVEW8dyCx2kRCvRniChu9YtnRk1MIbMUbR3ucC3UjnUK9VrvuyKp
	yLnUw6xGg4VlAWFL0MhDR/zZvUiEo11W2fkkZht3KHkfJoZSR3EG4nLmtLJ3+RidiYMOe2A0rq8
	MeJD1+ffE/TpsKo9wkbqac2td8i6bvkdBdPlqBTMdERRulPodaaUOnBs
X-Received: by 2002:a17:902:e944:b0:2e5:4604:c37a with SMTP id
 d9443c01a7336-2e87e303708mr18554105ad.18.1792002521805; Wed, 14 Oct 2026
 11:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-20-lrizzo@google.com>
 <52a702a4-14eb-4617-bd29-e3140fd36780@nvidia.com> <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
In-Reply-To: <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:28:05 +0200
X-Gm-Features: AclHuK-6TbXuD5dQp6Q_-RxWjRRPPqkpIpvGcrKlslQ4aEjsOkMcO7VIrHzh1iI
Message-ID: <CAMOZA0K4ZV53pE41AKoKz1g2wz3YENBz=HVoXng=RZbGyN3ssg@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 19/22] net/mlx5e: Use DMA_PMD memory for tx header
 bounce buffers
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
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

On Wed, Oct 14, 2026 at 7:51=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>

> > On 03.10.26 23:22, Luigi Rizzo wrote:

> > Why are only headers considered for bouncing? Because they have the
> > highest mapping overhead?
>
> I meant to say headers and small packets.

Headers have a high cost for the map/unmap (especially in strict iommu mode=
),
and also cause significant IOTLB thrashing, because they come from skb_head
that is not pre-mapped. The impact of IOTLB thrashing depends on
the hardware and load but they consume one IOTLB entry per packet with
almost non-existent recycling.

In the following version I have modified the slub and skb allocator to
feed skb head from DMA_PMD memory, which removes the need
for header bounce buffers. It is a compromise (the skb head includes
skb_shinfo, which we may not always want to expose to the device),
but gives an option to those who want it, and in that case drivers
that use pagepool can get all the benefits of DMA_PMD with zero
modifications.

> > Note that TSO/GSO packets will copy the header inline in the WQE
> > already. But not for small packets.

Yes additional bounce buffers are not needed on hardware that are
essentially using the WQE as a bounce buffer. I'll double check the patch
(mechanically generated).

Small packets should not be too problematic, as long as they come from
fragments allocated during the copy_from_user.

cheers
luigi
