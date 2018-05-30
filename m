Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B39967D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 14:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753041AbeE3OEU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 10:04:20 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40281 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753069AbeE3OEU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 10:04:20 -0400
Received: by mail-lf0-f66.google.com with SMTP id q11-v6so4496152lfc.7;
        Wed, 30 May 2018 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mWPykU63t54E919K4s1jwMnzwRFSHh+zOeEDwpYNiqw=;
        b=tos7+Bbk4BtTqurh3hLcfV/yrKvcLVDCE5d+zb2TxVfV2S/3defsgLnf79Jm/BTASZ
         rIf7ud/FdfXxs0IuvOga0R5lroGQQV967hV+3KkevzKO0yUgBQppr9ckjS8jrIwFUgYC
         BOVx1WOh2MCqPo9r7FbGiJX8XcdMkA94JQelcBhz/SoMQ02ryJe/Tw+OivV5WPZXybRu
         qpK8d14dZcG3MG1gGVMfj8sjvO33jLCVzKVbZZsgsbrfOoEvJGMdo03ir4zsINyjhYqb
         NBf2QwCl4sx7Z7oaDbC6XoIUr16IzmHx7EflVGXCJGZV1uk/6SB4lZ2GOnt8etmDG53k
         gtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mWPykU63t54E919K4s1jwMnzwRFSHh+zOeEDwpYNiqw=;
        b=NsB54YkWXpp46df6NRL5tFri8N0NeIVcp35rC8t+GsqdK/0umuGC2C9xGz9cODka/2
         bKqeguxn69vIfHzKBicCuYZKS6toMzM7E635fCupJLn8ynyIfsZinhfjx3bWPDU+CWpw
         pNOAh3zuZs3yu36WRBbjwpqnfqDSSNwPnLMnGuXSzRDs9ilFeNtFMK3s0Rk4aAzDTUgx
         XRVgveed3NBzlit32WOBBsUZ5/48UwR1lsWerrDz068lAatKe6Fv2KOLp4gcul2d5JKW
         Aqvjy/kIwKOuEmvhqHP+RMi8iMNiBSTgaAgdw0BUilu2AkH1s5lshZDQfe1Q+eef5oSV
         y9YA==
X-Gm-Message-State: ALKqPwehW6M47zvdjjgzd27iISvKP41CLU2AwF2+s07gaT+3NJuCD23O
        WMt1NTdZrwFJ5nR/KjD9dkU=
X-Google-Smtp-Source: ADUXVKJESzZ7jYAZiLkEqtsvHxrRDZp9vXB+EwrDvT3fZgGTYMIv3VLDniMnnlv7x/fZY+1hNhO7iw==
X-Received: by 2002:a2e:89d7:: with SMTP id c23-v6mr2312450ljk.22.1527689058253;
        Wed, 30 May 2018 07:04:18 -0700 (PDT)
Received: from gmail.com ([81.236.84.183])
        by smtp.gmail.com with ESMTPSA id a19-v6sm7880162lfi.86.2018.05.30.07.04.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 07:04:17 -0700 (PDT)
Date:   Wed, 30 May 2018 16:04:15 +0200
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: gadget: ccid: add support for USB CCID
 Gadget Device
Message-ID: <20180530140415.GE2939@gmail.com>
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
 <87r2ltcopp.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r2ltcopp.fsf@linux.intel.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Filipe,

On Wed, May 30, 2018 at 03:28:18PM +0300, Felipe Balbi wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
> 
> > Chip Card Interface Device (CCID) protocol is a USB protocol that
> > allows a smartcard device to be connected to a computer via a card
> > reader using a standard USB interface, without the need for each manufacturer
> > of smartcards to provide its own reader or protocol.
> >
> > This gadget driver makes Linux show up as a CCID device to the host and let a
> > userspace daemon act as the smartcard.
> >
> > This is useful when the Linux gadget itself should act as a cryptographic
> > device or forward APDUs to an embedded smartcard device.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> 
> this could be done entirely in userspace with functionfs, why do we need
> this part in the kernel? It does very little.

Andrzej pointed this out, and I actually do not have any good answer
more than that the userspace application could be kept small and the
important configuration of the CCID device is done with well (I hope)
documented configfs attributes.

> 
> -- 
> balbi

Best regards,
Marcus Folkesson


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
