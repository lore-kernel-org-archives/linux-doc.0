Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4B5A7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 22:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbeKHHzZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 02:55:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:45794 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbeKHHzZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Nov 2018 02:55:25 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B8C262ED;
        Wed,  7 Nov 2018 22:22:59 +0000 (UTC)
Date:   Wed, 7 Nov 2018 15:22:58 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Alessia Mantegazza <amantegazza@vaga.pv.it>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] doc:it_IT: add some process/* translations
Message-ID: <20181107152258.48267a2a@lwn.net>
In-Reply-To: <20181005185157.27819-1-federico.vaga@vaga.pv.it>
References: <20181005185157.27819-1-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  5 Oct 2018 20:51:57 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> This patch does not translate entirely the subfolder "process/"
> but only part of it (to begin with).
> 
> In order to avoid broken links, I included empty documents
> for those which are not yet translated.
> 
> In order to be able to refer to all documents in "process/",
> I added a sphinx label to those which had not one.
> 
> Translated documents:
> - howto
> - 1.Intro
> - clang-format
> - coding-style
> - kernel-driver-statement
> - magic-number
> - volatile-considered-harmful
> - development-process

So I'm (finally) ready to apply this, but it has conflicts against current
docs-next.  Could I ask you, please, to send me a respin?

Thanks,

jon
