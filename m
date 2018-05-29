Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 51B877D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 23:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968056AbeE2W7d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 18:59:33 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:42694 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967906AbeE2W7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 18:59:32 -0400
Received: by mail-pl0-f68.google.com with SMTP id u6-v6so9827190pls.9;
        Tue, 29 May 2018 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GlWOpEDuS1aCQEuQAna4s2kQ0BYv0CbvAgP3+x5dVZY=;
        b=OQsfd3IWNpta2D8RjfXMqu7c6D2MFcxUZlKbTjtIXI54etWF8ra2tURInTNR3AtalR
         ytULvnNvbzT57fx99eNNvZDPJKnrlVKPDpeRnXYIhIxnX315R8Yh6lj2icjQ8SZM1ueu
         F766onoecaFOBiISpwL57I6O4Pf/AU7W0flutSU780TxzkVsGpmOdspvZYOeFLkUZQjy
         HxAk/JpKeNqCR/0Ue7CxLGm7ctnLPwkQMBZY/pKicWd/WFZMeCq3H/6wxDXPk01q7K46
         29vS4sDPxPPe53quqqmZeELi1/iM1KtipsxLrxjlw/dyuhwlgLoFRBQiA074+oZS7LUd
         eZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GlWOpEDuS1aCQEuQAna4s2kQ0BYv0CbvAgP3+x5dVZY=;
        b=eZ/R7fdwOvZwx9ew3LbQQsprH7glGwYR3mAdCp2Keh3r53bvCOEwGpdM5kEFCqZZSR
         Nm3qoMCUNNGEugNWGAKLq177ggCqPBRLow3fYalAtlu14aOCd8rNM+1nW7lbOZ6Y2Tze
         AKc8Az6OwNnPCbmKLccmz01lCg656W5as/fOPhc3JrjFlQCNef6ln2GZ1IR3faG5GtuE
         xPxlM58Rxxf2xGVFI8Od8SK9Q5CqKUQm26EfCGt7DB06K6zzpuwOJu/gyZtfVQUcKpbJ
         oyDYojMvg4Aoh2PQQDsJx1ANV53h07EORuVEFqlACnxvAZr05X0FwlMIWZk//F0RbEl7
         Eshw==
X-Gm-Message-State: ALKqPwevdQqRCdOQNSqTekbCfTf/ikaXvr4Zyr/ih+YRVVuosO+yEn6C
        R9dGGBnC8XFvufs0bF0ocyY=
X-Google-Smtp-Source: ADUXVKJ6sExi7vHWohysc91x9PSB9s3yyytu6rhQu0ZnqAZMWfIJR5zPCI33xQFgcj6F8AqLwDP/xQ==
X-Received: by 2002:a17:902:8bc6:: with SMTP id r6-v6mr318414plo.257.1527634771750;
        Tue, 29 May 2018 15:59:31 -0700 (PDT)
Received: from dtor-ws ([2620:0:1000:1511:8de6:27a8:ed13:2ef5])
        by smtp.gmail.com with ESMTPSA id u19-v6sm44164878pgv.25.2018.05.29.15.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 May 2018 15:59:30 -0700 (PDT)
Date:   Tue, 29 May 2018 15:59:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, logang@deltatee.com,
        stefanha@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mk712: update documentation web link
Message-ID: <20180529225928.GF167092@dtor-ws>
References: <20180402125551.13641-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180402125551.13641-1-martink@posteo.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 02, 2018 at 02:55:50PM +0200, Martin Kepplinger wrote:
> At the mentioned address there's nothing found. By searching information
> on the controller chip still can be found, so update the link to the
> resulting page.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>

Applied, thank you.

> ---
>  drivers/input/touchscreen/mk712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/mk712.c b/drivers/input/touchscreen/mk712.c
> index bd5352824f77..c179060525ae 100644
> --- a/drivers/input/touchscreen/mk712.c
> +++ b/drivers/input/touchscreen/mk712.c
> @@ -17,7 +17,7 @@
>   * found in Gateway AOL Connected Touchpad computers.
>   *
>   * Documentation for ICS MK712 can be found at:
> - *	http://www.idt.com/products/getDoc.cfm?docID=18713923
> + *	https://www.idt.com/general-parts/mk712-touch-screen-controller
>   */
>  
>  /*
> -- 
> 2.16.2
> 

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
