Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11D6C47096
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 12:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6EE60FEE
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 12:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFFMda (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Jun 2021 08:33:30 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:57522 "EHLO
        hera.aquilenet.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhFFMd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Jun 2021 08:33:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by hera.aquilenet.fr (Postfix) with ESMTP id 0119032A;
        Sun,  6 Jun 2021 14:31:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
        by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0eesnSaL1bTv; Sun,  6 Jun 2021 14:31:36 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
        by hera.aquilenet.fr (Postfix) with ESMTPSA id 4980D1ED;
        Sun,  6 Jun 2021 14:31:36 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1lprwF-00GY0j-7W; Sun, 06 Jun 2021 14:31:35 +0200
Date:   Sun, 6 Jun 2021 14:31:35 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc:     corbet@lwn.net, jani.nikula@linux.intel.com, gene@collinsnet.net,
        w.d.hubbs@gmail.com, steve.holmes88@gmail.com,
        speakup@linux-speakup.org, gregkh@linuxfoundation.org,
        rdunlap@infradead.org, grandmaster@al2klimov.de,
        chris@the-brannons.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: Convert the Speakup guide to rst
Message-ID: <20210606123135.idvji5rbvcc5lrai@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        corbet@lwn.net, jani.nikula@linux.intel.com, gene@collinsnet.net,
        w.d.hubbs@gmail.com, steve.holmes88@gmail.com,
        speakup@linux-speakup.org, gregkh@linuxfoundation.org,
        rdunlap@infradead.org, grandmaster@al2klimov.de,
        chris@the-brannons.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210603145953.10982-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603145953.10982-1-igormtorrente@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0119032A
X-Spamd-Result: default: False [-2.50 / 15.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         HAS_ORG_HEADER(0.00)[];
         RCVD_COUNT_THREE(0.00)[3];
         RCPT_COUNT_TWELVE(0.00)[13];
         FREEMAIL_TO(0.00)[gmail.com];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Igor Matheus Andrade Torrente, le jeu. 03 juin 2021 11:59:53 -0300, a ecrit:
> @@ -0,0 +1,1421 @@
> +.. SPDX-License-Identifier: GPL-2.0

People have agreed to dual-licence GFDL and GPL, not only publish under
GPL. So

.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.2-no-invariants-or-later

Samuel
