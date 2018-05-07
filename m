Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 742DD7DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 15:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752196AbeEGPtL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 11:49:11 -0400
Received: from mail-yw0-f171.google.com ([209.85.161.171]:40992 "EHLO
        mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751947AbeEGPtK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 11:49:10 -0400
Received: by mail-yw0-f171.google.com with SMTP id q125-v6so4646077ywc.8;
        Mon, 07 May 2018 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n54zLLf3NPznh4KdvZZFwLWSH22oBhBH1oVbfm4mF7o=;
        b=ryQCqiFySuigH2ZMMVEg19M3JB3gXWaSJWJF/J/Fap3wa3fm/o/uoJ8X8rIL5t79xu
         t1VKAUSw78K73jxzaaHK2bfSGM8+j+Bx1Eib5CDXvaAAtU72QjanIY4xd+6IMivHkmpo
         XJVZtrULHbB6rKDiE6BVR1HJS7VsHwSEJxfJFilOtayfmHW5EkPJVj1STB0320LQz5iW
         zyNSrXduzVlGgY+mkXhumqSXpsNfXyicLIlzosc3JL6bMqKRPUQuIpjs0wErVOXRXdi3
         QAKlbiQsOdeuamsb4Z/BSmCM4iasXHRzYGb1n2+s2S/cHVhilbkwO+M1X1Dj982qlzoj
         7Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=n54zLLf3NPznh4KdvZZFwLWSH22oBhBH1oVbfm4mF7o=;
        b=ADZrXcULLD1qPyCKH8thR+UpKzLNrNOEnuBijzac7XDJPyB1Xyz5W8lYGXB3vtlTFQ
         3+QaGjRcp44xRl1NjwcW1ILbUjN5XbB197A+jf35YehitMm63EruHt+RRQYj/b4C6QFT
         Vbt2c4pVvpDjHx+96jyPSHb7tiw6PBV3WcLKR0mspPiaoGsMJRdZPVJPwyvCOCiiKp4+
         Pb329Nn8d+NGzw0PzSPDwOa4yRLsQ/9Vo2PhGGyPKLF71S9+gLCn/9cawE2AKTaF4ik9
         6rCFoBIqDxXWmENkdrWRHCz4s8zhnhoWpg0suqlU10apruPtg5691P2igDY0WR4Q/iSs
         elVQ==
X-Gm-Message-State: ALQs6tBb0TcUSZCCUmUvYD3J8+gBzqcNXdjRZfyxp2vHKyfV81QImOFd
        0fq3TYidLwhxGw7bvpKBW0w=
X-Google-Smtp-Source: AB8JxZorUEwEFj7aFYpUsJ5s3wlKYnow+fO2l9SuA0pAEvULCjKTk82MffchUdf71e3wEQKB+K2sIQ==
X-Received: by 2002:a81:2d56:: with SMTP id t83-v6mr20039676ywt.344.1525708150186;
        Mon, 07 May 2018 08:49:10 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:981a])
        by smtp.gmail.com with ESMTPSA id q127-v6sm4818117ywb.90.2018.05.07.08.49.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 May 2018 08:49:09 -0700 (PDT)
Date:   Mon, 7 May 2018 08:49:08 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-ide@vger.kernel.org, tglx@linutronix.de,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] libata: remove ata_sff_data_xfer_noirq()
Message-ID: <20180507154908.GF2368884@devbig577.frc2.facebook.com>
References: <20180504150620.6501-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180504150620.6501-1-bigeasy@linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Sebastian.

On Fri, May 04, 2018 at 05:06:20PM +0200, Sebastian Andrzej Siewior wrote:
> ata_sff_data_xfer_noirq() is invoked via the ->sff_data_xfer hook. The
> latter is invoked by ata_pio_sector(), atapi_send_cdb() and
> __atapi_pio_bytes() which in turn is invoked by ata_sff_hsm_move().
> The latter function requires that the "ap->lock" lock is held which
> needs to be taken with disabled interrupts.
> 
> There is no need have to have ata_sff_data_xfer_noirq() which invokes
> ata_sff_data_xfer32() with disabled interrupts because at this point the
> interrupts are already disabled.
> Remove the function and its references to it and replace all callers
> with ata_sff_data_xfer32().

Can you please add irq disabled assert to ata_sff_data_xfer*()?

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
