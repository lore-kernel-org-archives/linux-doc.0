Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2D8CA7DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 15:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752144AbeEGPwY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 11:52:24 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:51945 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbeEGPwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 11:52:23 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1fFiQz-0008QS-7P; Mon, 07 May 2018 17:52:17 +0200
Date:   Mon, 7 May 2018 17:52:17 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Tejun Heo <tj@kernel.org>
Cc:     linux-ide@vger.kernel.org, tglx@linutronix.de,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] libata: remove ata_sff_data_xfer_noirq()
Message-ID: <20180507155216.g3ycg3e5pvnmhztz@linutronix.de>
References: <20180504150620.6501-1-bigeasy@linutronix.de>
 <20180507154908.GF2368884@devbig577.frc2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180507154908.GF2368884@devbig577.frc2.facebook.com>
User-Agent: NeoMutt/20180323
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018-05-07 08:49:08 [-0700], Tejun Heo wrote:
> Hello, Sebastian.
> 
> On Fri, May 04, 2018 at 05:06:20PM +0200, Sebastian Andrzej Siewior wrote:
> > ata_sff_data_xfer_noirq() is invoked via the ->sff_data_xfer hook. The
> > latter is invoked by ata_pio_sector(), atapi_send_cdb() and
> > __atapi_pio_bytes() which in turn is invoked by ata_sff_hsm_move().
> > The latter function requires that the "ap->lock" lock is held which
> > needs to be taken with disabled interrupts.
> > 
> > There is no need have to have ata_sff_data_xfer_noirq() which invokes
> > ata_sff_data_xfer32() with disabled interrupts because at this point the
> > interrupts are already disabled.
> > Remove the function and its references to it and replace all callers
> > with ata_sff_data_xfer32().
> 
> Can you please add irq disabled assert to ata_sff_data_xfer*()?

Why irq-disabled assert? Can we use lockdep_assert_held() instead?

> Thanks.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
