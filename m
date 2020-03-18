Return-Path: <SRS0=afVm=5D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02A3C10F29
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFF0F2076D
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2MIpHhM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgCRSr0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Mar 2020 14:47:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40268 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCRSr0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 14:47:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so14348161pfl.7
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4RNKFU+ZJi4L4AqhMrPyVKFF7dv4MRhXQ9q4lfcuDPE=;
        b=M2MIpHhMNCv0YOyKf5uJ7FEzjprOaQOsNk/6IK5iPyXjCKSuJ9aYuKLoLjUPfrxk3q
         RwbQ8x7F3wPLuJj49VDd2qZiOeY0Wh7I6/eEWUSkfk3LziWjvIUddD9Me829bjOvLlQK
         lemzRtBvgwLkYWRrFifXEtc/T98ddw/OQnOog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4RNKFU+ZJi4L4AqhMrPyVKFF7dv4MRhXQ9q4lfcuDPE=;
        b=EtNT0hD3UOW+Z1V21mCKyaVk1ovg+ltCUs4+x+O6bYKoTgQ9IdS5no0jOGXlGFW0gY
         vPWF4MVNk0QOwCcmVjs018ytEId338C0b3fkObWDtnb+Vwvw00+uC8kHZudddF8PhXF9
         BrBTNUxUBWeKnQRJsMziSdNiqme39kdl0QcHSHV2K3kk5HKujBQ5dDCUq6XZMyyEBU+d
         Q+H2LTMiPKRyI0l6WEy0GDVbYFlxnPsheUEEifyj00Z3S0a1XFYtD/9KuDbRFUjbmAri
         j2uzhsatQB7jJJzCT7FaCN2QgWqffQkjEbDuwSoIMc/fyKM0iES7BW6JRLTdDQfd/b12
         urgQ==
X-Gm-Message-State: ANhLgQ0vEikaNbrTkQS4TbLXpn72HW/7iuaHdE2IdXFQ1loNrhtaArSe
        DVEx/F5wLSaYN3v3SUYA5kMOULnM7Ts=
X-Google-Smtp-Source: ADFU+vsmPgtkbZ7sbpQemn+32frJFMeX0HI90UxTYTcUumetCAWKNki7U7meshbQoWPNvDxJsMGO/Q==
X-Received: by 2002:a63:3753:: with SMTP id g19mr6338589pgn.262.1584557242793;
        Wed, 18 Mar 2020 11:47:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d7sm7520039pfa.106.2020.03.18.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 11:47:21 -0700 (PDT)
Date:   Wed, 18 Mar 2020 11:47:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 09/11] pstore/blk: blkoops: support special removing
 jobs for dmesg.
Message-ID: <202003181144.BD1DE93@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-10-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581078355-19647-10-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 07, 2020 at 08:25:53PM +0800, WeiXiong Liao wrote:
> It's one of a series of patches for adaptive to MTD device.
> 
> MTD device is not block device. To write to flash device on MTD, erase
> must to be done before. However, pstore/blk just set datalen as 0 when
> remove, which is not enough for mtd device. That's why this patch here,
> to support special jobs when removing pstore/blk record.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  Documentation/admin-guide/pstore-block.rst |  9 +++++++++
>  fs/pstore/blkoops.c                        |  4 +++-
>  fs/pstore/blkzone.c                        |  9 ++++++++-
>  include/linux/blkoops.h                    | 10 ++++++++++
>  include/linux/pstore_blk.h                 | 11 +++++++++++
>  5 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
> index 299142b3d8e6..1735476621df 100644
> --- a/Documentation/admin-guide/pstore-block.rst
> +++ b/Documentation/admin-guide/pstore-block.rst
> @@ -200,6 +200,15 @@ negative number will be returned. The following return numbers mean more:
>  1. -EBUSY: pstore/blk should try again later.
>  #. -ENEXT: this zone is used or broken, pstore/blk should try next one.
>  
> +erase
> +~~~~~
> +
> +It's generic erase API for pstore/blk, which is requested by non-block device.
> +It will be called while pstore record is removing. It's required only when the
> +device has special removing jobs. For example, MTD device tries to erase block.
> +
> +Normally zero should be returned, otherwise it indicates an error.
> +
>  panic_write (for non-block device)
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
> index 01170b344f00..7cf4731e52f7 100644
> --- a/fs/pstore/blkoops.c
> +++ b/fs/pstore/blkoops.c
> @@ -164,6 +164,7 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>  	bzinfo->dump_oops = dump_oops;
>  	bzinfo->read = bo_dev->read;
>  	bzinfo->write = bo_dev->write;
> +	bzinfo->erase = bo_dev->erase;
>  	bzinfo->panic_write = bo_dev->panic_write;
>  	bzinfo->name = "blkoops";
>  	bzinfo->owner = THIS_MODULE;
> @@ -383,10 +384,11 @@ int blkoops_register_blkdev(unsigned int major, unsigned int flags,
>  	bo_dev.total_size = blkoops_bdev_size(bdev);
>  	if (bo_dev.total_size == 0)
>  		goto err_put_bdev;
> -	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
>  	bo_dev.flags = flags;
>  	bo_dev.read = blkoops_generic_blk_read;
>  	bo_dev.write = blkoops_generic_blk_write;
> +	bo_dev.erase = NULL;
> +	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
>  
>  	ret = blkoops_register_device(&bo_dev);
>  	if (ret)

I think this patch, like the prior, needs to be reordered in the series.
How about adding

blkoops_register_device()

as a single patch, which is what provides support for the "non-block"
block devices? Then the blkoops_register_blkdev() can stand alone in the
first patch?

It just might be easier to review, since nothing uses
blkoops_register_device() until the mtd driver is added. So that
function and this patch would go together as a single "support non-block
devices" change.

> diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
> index 205aeff28992..a17fff77b875 100644
> --- a/fs/pstore/blkzone.c
> +++ b/fs/pstore/blkzone.c
> @@ -593,11 +593,18 @@ static inline bool blkz_ok(struct blkz_zone *zone)
>  static inline int blkz_dmesg_erase(struct blkz_context *cxt,
>  		struct blkz_zone *zone)
>  {
> +	size_t size;
> +
>  	if (unlikely(!blkz_ok(zone)))
>  		return 0;
>  
>  	atomic_set(&zone->buffer->datalen, 0);
> -	return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
> +
> +	size = buffer_datalen(zone) + sizeof(*zone->buffer);
> +	if (cxt->bzinfo->erase)
> +		return cxt->bzinfo->erase(size, zone->off);
> +	else
> +		return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
>  }
>  
>  static inline int blkz_record_erase(struct blkz_context *cxt,
> diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
> index bc7665d14a98..11cb3036ad5f 100644
> --- a/include/linux/blkoops.h
> +++ b/include/linux/blkoops.h
> @@ -33,6 +33,15 @@
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
>   *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
> + * @erase:
> + *	The general (not panic) erase operation. It will be call while pstore
> + *	record is removing. It's required only when device have special
> + *	removing jobs, for example, MTD device try to erase block.
> + *
> + *	Both of the @size and @offset parameters on this interface are
> + *	the relative size of the space provided, not the whole disk/flash.
> + *
> + *	On success, 0 should be returned. Others mean error.
>   * @panic_write:
>   *	The write operation only used for panic.
>   *
> @@ -53,6 +62,7 @@ struct blkoops_device {
>  	unsigned long total_size;
>  	blkz_read_op read;
>  	blkz_write_op write;
> +	blkz_erase_op erase;
>  	blkz_write_op panic_write;
>  };
>  
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index bbbe4fe37f7c..9641969f888f 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -46,6 +46,15 @@
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
>   *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
> + * @erase:
> + *	The general (not panic) erase operation. It will be call while pstore
> + *	record is removing. It's required only when device have special
> + *	removing jobs, for example, MTD device try to erase block.
> + *
> + *	Both of the @size and @offset parameters on this interface are
> + *	the relative size of the space provided, not the whole disk/flash.
> + *
> + *	On success, 0 should be returned. Others mean error.
>   * @panic_write:
>   *	The write operation only used for panic. It's optional if you do not
>   *	care panic record. If panic occur but blkzone do not recover yet, the
> @@ -59,6 +68,7 @@
>   */
>  typedef ssize_t (*blkz_read_op)(char *, size_t, loff_t);
>  typedef ssize_t (*blkz_write_op)(const char *, size_t, loff_t);
> +typedef ssize_t (*blkz_erase_op)(size_t, loff_t);
>  struct blkz_info {
>  	struct module *owner;
>  	const char *name;
> @@ -71,6 +81,7 @@ struct blkz_info {
>  	int dump_oops;
>  	blkz_read_op read;
>  	blkz_write_op write;
> +	blkz_erase_op erase;
>  	blkz_write_op panic_write;
>  };
>  
> -- 
> 1.9.1
> 

-- 
Kees Cook
