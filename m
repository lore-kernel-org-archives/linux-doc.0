Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3E3659EC
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382727; cv=pass; b=HdrufRfL7vRg65hp/qJEaduEFdfGa/dzhY1VkBXuN56UsxZq32lkWXd26WRiBdY9KToxuaKe9qBM+aewLDTo1fY4AxEj9IYeLhnaO2WUbJZEhYclee71asjBrdSRNSOJl9gVtETW95yYOPrvG3IF2LPcG7Uikq10+B6CWG7/V54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382727; c=relaxed/simple;
	bh=GhaJom9Vi7tpxXr7oDaVKbjVC897hRfBqfGeSiwaBuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbZzkKQfslHq+ib6bO+WmnKhOj1G+TvRGCbABC6wd0XHeKP2fqVpfOu2Zsim3D9wwBPppDiyfBJVbp1C6yYaVgg4B3tgCNT4s11oWpc6AzL4AVc4oW8qLBYK33QP1FVUbcQ/UO+Y+x9BrRZyHDoCzAjhlvhoyqEdkQaKFnQPHG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=APCfdoRB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ME4XaljV; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="APCfdoRB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ME4XaljV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773382725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhaJom9Vi7tpxXr7oDaVKbjVC897hRfBqfGeSiwaBuI=;
	b=APCfdoRBsu31xszLvt+fRJrZFtWe3nc0VTQ/1NseYTxCpchfoqASB54acZwwVdTt+Fx7BN
	hUC7t3SPEAizmyVqIezR3lH+Oc9zxYidqZiKcziQd+e4HakQXw1XCe+GJjrzdvAZMG4tGn
	06MrzpPgyJQ0iTfwegovYRMSZl6pDII=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-VNmNOxXsOD-WUTKvBEg20A-1; Fri, 13 Mar 2026 02:18:43 -0400
X-MC-Unique: VNmNOxXsOD-WUTKvBEg20A-1
X-Mimecast-MFC-AGG-ID: VNmNOxXsOD-WUTKvBEg20A_1773382723
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecd4f7c37so4435965ad.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 23:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773382722; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf5I4NQ0nZaA1AY3yXbiJ2eiY0+7lwICO2H7qinN/TBWig+3v+TZh5Cl/H7bx+P14e
         vwluDxKcO9RFODc4fOxqbGxX5LDK0MFrt/SIL9mxJtAiKegIeT4Q6bDCVcGT9i+NuRkT
         0j4FmkSrqYnfQc5U4hE1JHxjky6v1M02esbzYhggXKPm92UD02NSWp4QN9b2CqYI07zF
         zIL65phItlUDRvblJtXWHw3J/y5ZUnYcNvNkYtelz1efyFN+1is0Wjwow6k8EtUnwLAq
         vuUnLdeK6DSxiporeV7sGecES0H5phdtfwE9pSTvLF+xX93L0zS9emz55jGzQCfLQyNT
         VbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhaJom9Vi7tpxXr7oDaVKbjVC897hRfBqfGeSiwaBuI=;
        fh=DYZwvAp4nSnLdJGNmFOKw+aI/NcbHbO4IBT3g3mT4a8=;
        b=H62SpepZB/B8OuH78BES1XHB+0UUwUZJyddFGcy7mW6DXj3xh//98GlP/7aFxrGwFL
         9mJ2/Y+SsrpnlZuxhYfheLScjNK/59WSO+IS/Au+buAkJOblo1rWSicmNgG71i6rWnhQ
         lyHrcrbqTKcsmV7F5syGfoCGxlRxLe8iyPild7I8tRay/+RIvlEloker7cuOUM8GxQ4U
         TKaNW0vF9VzsZwETZo9ufd0MVZuDxBUke3ycslCYlDRXaWW3AqI9U1q7drp7L5qMQa2y
         KfKmM2OAk8QTRXaAf/K565up259rvnwOMkN1XIPIE9lD9XcxhlWFGcxDrBmcfjI5d9DT
         tIFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773382722; x=1773987522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhaJom9Vi7tpxXr7oDaVKbjVC897hRfBqfGeSiwaBuI=;
        b=ME4XaljVEGqVAdBHjbEOxpKsvWseQhS/pGpurT1iHmaXk2KEJKWYE8q6IXkXowBmn6
         5ZOv5QbLyE6C+Nfo6n2cMDUJDuI4VsH4imqFpF+LVv40fy1CUWwIkjeuKVs8whVZ7uCy
         EbLpKSY1Jh1azVfZzF0YWFzUnkakUOIezpgRuex8slUvhYpe8awXWk65pkbIR3DhN90X
         5CxPwR/LKTT5CroiElLOdvFz086H86hsYjfduqB+oJwpEMdXISTO7CgH4v7WgDzbmfBi
         cSgOCrNMsx3HI/Hk31PePVc+qpjVr3uWx8y+STo4KDrpsyDfntb5HH/PtVudWfJIoFav
         21Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382722; x=1773987522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhaJom9Vi7tpxXr7oDaVKbjVC897hRfBqfGeSiwaBuI=;
        b=anxjmNrARDP0c3BGOCzDVwIZl958U9pKFSRocdEsHUBakdYK8M4ZUsiyoMPgBnv2A8
         fzieJatKRDoZwbOnTRosfVJWH9Tt7N1xtX+qM6t26HOzL+Rs68jcM8WR0PdDhmqnezMq
         4Zbogocc7dwUGlk2mJL27disBSNUMo58IVrm12dBaf0k1Oi5WxAymXivzbzhp5fQtAjU
         qkt3+4omBwi0m9QtTC8pNgA8Y3f3XTO6GE7Lqt7pIdsU0mZ/8JGmUXFLaJ3QGeSZ5NIB
         12qtUlZYNGdP8qhk20/A3GgWGuRwK9WmKzaGrod9oP+TAvTfyjU9leNLTnNHpEySbgY2
         AIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyaninBTqY7zgIZewlI33rFrVvOIFpn4xSe+BEzGNwQkFa7iTRLdpywy8jfhnLfISWb2Sk9yt/COE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pp6ElOHwHcfpvY1NItgkk3jS8GH+E7awHI+diX9CrxnVPytz
	lPQ3HvRCml0vEjUwN2SdXhGY9wYGkBNQ0D6y4YYobqK2w1/4apAaO7hOnC65r2YwPGxFo3qCkXj
	Xoy5gLMfOOwI/4SeAOZyxpzIzb58QW2A4aEc7iUZHXTJWtBsb1wSSlp+28GESypgWJD4NKmub+T
	uOykqoaFolwAZlgVdBFGvb2rXu6kAYUSwwAJVPQsdD9CBHqds=
X-Gm-Gg: ATEYQzyuAzvADty7RwLku1243BVVWzTk7lH4TFjdV9Z9Qza+y9S/7QZV9XKXJpHYbm3
	uAMAiKPr/6fDuamwfG4aFbxg31ixsyLI3GY4moTd4YBoCh4ipC8WiASreNmlQx/PUn6QW99Jnl2
	t3mN0jPr3A79ANrdk2YhsxKTHt4DCYD38t8CRVQ9MHf9Zr2ExT0wM8MAaqydTDNhVRbek1Kd8rT
	iM=
X-Received: by 2002:a05:6a20:cc0b:b0:398:b61e:ff49 with SMTP id adf61e73a8af0-398ecd396b6mr1762980637.49.1773382722051;
        Thu, 12 Mar 2026 23:18:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0b:b0:398:b61e:ff49 with SMTP id
 adf61e73a8af0-398ecd396b6mr1762951637.49.1773382721627; Thu, 12 Mar 2026
 23:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZVx999y-DvB7Dp2ekoHk6s8aqqScd2gKSY4ySGAK6NNXeH5g@mail.gmail.com>
In-Reply-To: <CAAZVx999y-DvB7Dp2ekoHk6s8aqqScd2gKSY4ySGAK6NNXeH5g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Mar 2026 14:18:30 +0800
X-Gm-Features: AaiRm50ufnhualN_GPqqA8VArNbrVUugmk7--xHwxcWqjvMX3sr4KWxvuUQv5M0
Message-ID: <CACGkMEtY8UobTG9mj2geiNWcp1RtxzNAYvhXuLdVW0is4AFonA@mail.gmail.com>
Subject: Re: [PATCH] virtio: document the map API in the driver writing guide
To: John S <xaum.io@gmail.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, virtualization@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 5:58=E2=80=AFAM John S <xaum.io@gmail.com> wrote:
>
> Add a new "Buffer mapping" section to the virtio driver writing guide
> documenting the virtio map API (struct virtio_map_ops). This API was
> introduced in commit bee8c7c24b73 ("virtio: introduce map ops in virtio
> core") to allow transports and devices that do not perform DMA (such
> as VDUSE) to provide their own buffer mapping logic instead of abusing
> the DMA API.
>
> The new section explains when and why custom map ops are used, documents
> the virtio_map_ops structure and the union virtio_map token, and
> references the driver-facing mapping helpers with their kernel-doc.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

