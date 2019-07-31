Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F305F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 18:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfGaSv0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 14:51:26 -0400
Received: from ms.lwn.net ([45.79.88.28]:55586 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfGaSv0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Jul 2019 14:51:26 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EE7997DA;
        Wed, 31 Jul 2019 18:51:25 +0000 (UTC)
Date:   Wed, 31 Jul 2019 12:51:24 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: Re: [PATCH] doc:it_IT: translations for documents in process/
Message-ID: <20190731125124.46e06ab6@lwn.net>
In-Reply-To: <20190728092054.1183-1-federico.vaga@vaga.pv.it>
References: <20190728092054.1183-1-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 28 Jul 2019 11:20:54 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> From: Alessia Mantegazza <amantegazza@vaga.pv.it>
> 
> Translations for the following documents in process/:
>     - email-clients
>     - management-style
> 
> Signed-off-by: Alessia Mantegazza <amantegazza@vaga.pv.it>
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>

This looks generally good, but I have to ask...

> +Se la patch che avete inserito dev'essere modificata usato la finestra di
> +scrittura di Claws, allora assicuratevi che l'"auto-interruzione" sia
> +disabilitata :menuselection:`Configurazione-->Preferenze-->Composizione-->Interruzione riga`.

Have you actually verified that the translations used in these mail
clients matches what you have here?

Thanks,

jon
