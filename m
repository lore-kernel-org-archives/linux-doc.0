Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D7DD7D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 17:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388973AbeGKRvZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 13:51:25 -0400
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40441 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388972AbeGKRvZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 13:51:25 -0400
Received: by mail-qk0-f193.google.com with SMTP id c126-v6so5351427qkd.7;
        Wed, 11 Jul 2018 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gJaG6vK39+Rz3fr/D4PZpOnxbvG5sXK8U9Fj+PSBkM4=;
        b=FqOTUiq5wKs2uMB3egZXoLVPAtk9okHquXXVWXzYYKSim/kLqKSZDDN4x/D0ptqPC4
         tBm4Euoi0U5qd7euViQKCL95qpuwFHJLaz5vYEJ3mfsEl5vypd09/NqWBUJpJdKPlPxI
         rxIm2AtBEQK7+oOObOeP5rhnSZ3aGHCjlLNjmDPs5dhzZppUmFlpW73xrOrrC1WELFzk
         pK+lFih15W0sNAcFQtnmOcse4PccKZdbAOYR1qcusR/jP5TRcABM6Swv0Wo1GtoBgE9a
         0p9X/ozUlT+idfguFz95dBkt3geIzFkgERUZ1y6n13AmMvNMJTc39BQ10g7iM7PaUvqO
         3KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gJaG6vK39+Rz3fr/D4PZpOnxbvG5sXK8U9Fj+PSBkM4=;
        b=VXckm0JJLwTwhFOqt6sBMD4WyPRHUtqOzbcBNzHnne8Q0iAp1T0Ke2j7CDznfgcerd
         2D6NSf75G/8wWBvwjeTlFq/hAYgMD2sh3PFsJsDR93UAZEDCpzdQKYTdcDhFxWzypOf7
         ZhIhLUiWz9N7Prex0A87GjDmTOREXnRYQRpSgKJPFWgrfL4/3uQG/2ZHwOklyPzIAkOi
         FGNmVEM8T1MhTzxkvwnFQAETo07AxwM/GZD/WGiH4Vx0+Mk/gTbbBw8Syz8N/8ZrXwTw
         YJ7o9NHEGRchuVZduP6G4UgG4zts00Nh7nKHSl0zEvSjiwMr5hHqD+2GwACHYb3MBe3q
         rs3Q==
X-Gm-Message-State: APt69E3xXx37KngqCGVk0QGqnfNUpyq2u9iICIrlmD1sncbM3IwKjatY
        BySL+ARDdGgo8WS7s62Gfey/FOpo
X-Google-Smtp-Source: AAOMgpcAcRT0TKl9GGWvxahMU5ilEE+Clz7pG0PhIgGbWYdyZs6ITvknOV8/Xn0D2EjLWYcmSG9q2g==
X-Received: by 2002:a37:1964:: with SMTP id k97-v6mr25926225qkh.83.1531331160624;
        Wed, 11 Jul 2018 10:46:00 -0700 (PDT)
Received: from localhost ([2620:10d:c091:180::1:7350])
        by smtp.gmail.com with ESMTPSA id w10-v6sm11651231qtn.74.2018.07.11.10.45.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jul 2018 10:45:59 -0700 (PDT)
Date:   Wed, 11 Jul 2018 10:45:58 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-ide@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        tglx@linutronix.de
Subject: Re: [PATCH REPOST] libata: remove ata_sff_data_xfer_noirq()
Message-ID: <20180711174558.GG72677@devbig577.frc2.facebook.com>
References: <20180711152105.21137-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711152105.21137-1-bigeasy@linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 11, 2018 at 05:21:05PM +0200, Sebastian Andrzej Siewior wrote:
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
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to libata/for-4.19.

Nice cleanup.  Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
