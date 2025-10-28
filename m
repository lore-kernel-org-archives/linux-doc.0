Received: from sg-1-23.ptr.blmpb.com (sg-1-23.ptr.blmpb.com [118.26.132.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5A32BF25
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653567; cv=none; b=p5tYBeYq833IkrkjBBhliE3ufjJDRnD91JHqwunvW1cNADmqC+WOEeaMEFAY0eq7UiZB0i3TyxyV1SYL+UrANg22Gbw0YaLFgiIf/7HbS/1SxLGDqLCUNLB5LhkSqKxd3zCDKAlY4PhnF9lYSoD+DXGOSTnORe4ll78TmbWtNvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653567; c=relaxed/simple;
	bh=VHWMyh+dNeS7BtojdmRX1nPfTRSvy/CcULphApk7kp4=;
	h=Message-Id:To:Date:Mime-Version:References:From:Cc:Subject:
	 Content-Type:In-Reply-To; b=kyJW/UR2ov+0ZJNRjGOVEtM/++nOJKvqfU9/ZqHJACr0dR8+ogNMx6SXsOdDVSoIplpPys9Vt5tClYp5IoJQS5TPhf9O/c0Ip4P5VtX14AGQ37vnXCb4B9JhwbG36ZwJd1Um8xRvHVvAcRXAcBwP7eAJ0kCG7mMEnrT8kUrlnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=nXdbxDQ2; arc=none smtp.client-ip=118.26.132.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="nXdbxDQ2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1761653553;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=giOIBPqQRzHEKUfrCcJhqjbXIb2PCt2QXcLYfGYvyaE=;
 b=nXdbxDQ2ijSWjtZ/OzbojwXkQnhFrq1Ekia2LIzdq6CMavaFI3RZ/QQM2BV3oBZfHfy/Pm
 yLceT7D1UA3B/lsGSVV6CxfN2/5/ZpCmhCRvKzzP76B13TVnlMNwNJG+x5fJXdBj9Pn5g8
 uRm2KjlSitEgwIVZQJ9zvgyYruMTe+MVPoLexrJIGUdGsEBZPB9nhNTDu4uZ4dnBdSDo04
 72klgAValLCyAXQT5mzt/rI0rT6RWY/Dgz4ioegur8Dvm2xkE5yU/1e8Kk2xopCTOLMQva
 yWMCuVcz7PraruoaiibES25yQKlETGuewiJAwPRdcmiGCF00AnAVe+dFSkrMnw==
Message-Id: <effbcb62-9bf7-45ff-ad39-1e3be1e63650@fnnas.com>
X-Lms-Return-Path: <lba+26900b32f+d46e72+vger.kernel.org+yukuai@fnnas.com>
Content-Transfer-Encoding: quoted-printable
To: <linan122@huawei.com>, <corbet@lwn.net>, <song@kernel.org>, 
	<hare@suse.de>, <xni@redhat.com>
Date: Tue, 28 Oct 2025 20:12:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251027072915.3014463-1-linan122@huawei.com> <20251027072915.3014463-4-linan122@huawei.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Yu Kuai <yukuai@fnnas.com>
Received: from [192.168.1.104] ([39.182.0.168]) by smtp.feishu.cn with ESMTPS; Tue, 28 Oct 2025 20:12:30 +0800
From: "Yu Kuai" <yukuai@fnnas.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-raid@vger.kernel.org>, <linan666@huaweicloud.com>, 
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>, <yukuai@fnnas.com>
Subject: Re: [PATCH v7 3/4] md/raid0: Move queue limit setup before r0conf initialization
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20251027072915.3014463-4-linan122@huawei.com>
Reply-To: yukuai@fnnas.com

Hi,

=E5=9C=A8 2025/10/27 15:29, linan122@huawei.com =E5=86=99=E9=81=93:
> From: Li Nan <linan122@huawei.com>
>
> Prepare for making logical blocksize configurable.
>
> Move raid0_set_limits() before create_strip_zones(). It is safe as fields
> modified in create_strip_zones() do not involve mddev configuration, and
> rdev modifications there are not used in raid0_set_limits().
>
> 'blksize' in create_strip_zones() fetches mddev's logical block size. Thi=
s
> change has no impact until logical block size becomes configurable.
>
> Signed-off-by: Li Nan <linan122@huawei.com>
> ---
>   drivers/md/raid0.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index e443e478645a..49477b560cc9 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -68,7 +68,7 @@ static int create_strip_zones(struct mddev *mddev, stru=
ct r0conf **private_conf)
>   	struct strip_zone *zone;
>   	int cnt;
>   	struct r0conf *conf =3D kzalloc(sizeof(*conf), GFP_KERNEL);
> -	unsigned blksize =3D 512;
> +	unsigned int blksize =3D queue_logical_block_size(mddev->gendisk->queue=
);
>  =20
>   	*private_conf =3D ERR_PTR(-ENOMEM);
>   	if (!conf)

I think the following setting of blksize can be removed as well.

blksize =3D max(blksize, ...)

Thanks,
Kuai

> @@ -405,6 +405,12 @@ static int raid0_run(struct mddev *mddev)
>   	if (md_check_no_bitmap(mddev))
>   		return -EINVAL;
>  =20
> +	if (!mddev_is_dm(mddev)) {
> +		ret =3D raid0_set_limits(mddev);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	/* if private is not null, we are here after takeover */
>   	if (mddev->private =3D=3D NULL) {
>   		ret =3D create_strip_zones(mddev, &conf);
> @@ -413,11 +419,6 @@ static int raid0_run(struct mddev *mddev)
>   		mddev->private =3D conf;
>   	}
>   	conf =3D mddev->private;
> -	if (!mddev_is_dm(mddev)) {
> -		ret =3D raid0_set_limits(mddev);
> -		if (ret)
> -			return ret;
> -	}
>  =20
>   	/* calculate array device size */
>   	md_set_array_sectors(mddev, raid0_size(mddev, 0, 0));
