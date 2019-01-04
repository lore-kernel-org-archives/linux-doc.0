Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3CEEC7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 16:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfADQkh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 11:40:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46016 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfADQkh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 11:40:37 -0500
Received: by mail-pf1-f194.google.com with SMTP id g62so18536860pfd.12
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 08:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4K6/58rF/cIkxjJlOgUwcSNRVGtu/Z+fXx35ZBQkrso=;
        b=l9ODcFWe6MTL9yKPcGTsfplB4Vjcw5be1ZPN7q9U8LLnLBm2HqatkFs8BtuLifn5zy
         5YJqWsi0svvMh28fkgDrk7x2uYCrXPG5fNCwCj/09Qu0F6EmcY82irKtLmUMdLka6awy
         4jXptDBcIM0YKezIz9FE4TLGMAQhrDNR/42tZCq8OoFbYjrK7Rz7FitbSy/xC+bjjOUC
         0IiIXEwsmUS42ZGbYcer9YKO+WwHC3UIyR7Wrh2zojmJ0FJXtrwTHQNZ9Sgs9dVDduVY
         MH/N5vrGMcL3h3733zQOaQRNShEklILNNoRB6mKXGxP08Cwn4ogJjSocDd7edAUiT/1S
         lwPA==
X-Gm-Message-State: AA+aEWbZZWMmFmDEkujJ1PYhjJNEpfJAY8yndUi7WjuNXQwsMN1R1bBo
        xGmMWjWqcQXCKGnQDL2pA6jp4gNKTmy98w==
X-Google-Smtp-Source: AFSGD/VufKpNFuJ8lG4VPUQPNAxcEfsCZ1KboYEWvRb98cnwA6ggNq+DqI0X9tb2x1urn9NTeeIfxg==
X-Received: by 2002:a62:5b83:: with SMTP id p125mr53414792pfb.116.1546620036897;
        Fri, 04 Jan 2019 08:40:36 -0800 (PST)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5? ([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
        by smtp.gmail.com with ESMTPSA id 4sm97971101pfq.10.2019.01.04.08.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 08:40:36 -0800 (PST)
Message-ID: <1546620035.163063.42.camel@acm.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
From:   Bart Van Assche <bvanassche@acm.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Date:   Fri, 04 Jan 2019 08:40:35 -0800
In-Reply-To: <87k1jk8ycd.fsf@intel.com>
References: <20190104003957.82220-1-bvanassche@acm.org>
         <4009470.9o5kGc7Prg@harkonnen> <87k1jk8ycd.fsf@intel.com>
Content-Type: text/plain; charset="UTF-7"
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-01-04 at 13:18 +-0200, Jani Nikula wrote:
+AD4 Also, you probably do not wish the file to change when you switch
+AD4 branches with different upstream baselines. Or deal with possible emacs
+AD4 version dependent changes. I do like having the example in the kernel
+AD4 tree, but let the users deal with actually using the file. Placing the
+AD4 file at the top level makes it harder for users to have a file of their
+AD4 own there. This from an emacs user.

If this patch gets accepted upstream it won't take long before the
.dir-locals.el file ends up in all branches. Additionally, I expect that
the rate of change for this file will be low so I do not except any
inconsistencies between branches.

Regarding emacs versions: this patch has been tested with different emacs
versions. Additionally, the rate of change in emacs' CC mode is slow. Any
backwards incompatible changes in that mode would cause trouble to a very
large number of users so I do not expect radical changes in emacs' CC mode.

Regarding users having their own version of .dir-locals.el: why do you think
anyone would want to do that? Anyway, if anyone wants to replace that file
they can provide a .dir-locals-2.el file. See also
https://www.gnu.org/software/emacs/manual/html+AF8-node/emacs/Directory-Variables.html.

Bart.
