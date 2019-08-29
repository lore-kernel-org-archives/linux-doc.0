Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EEE37D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 15:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfH2PpA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 11:45:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:33464 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726670AbfH2Po7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Aug 2019 11:44:59 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 272F02CF;
        Thu, 29 Aug 2019 15:44:59 +0000 (UTC)
Date:   Thu, 29 Aug 2019 09:44:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Gerald BAEZA <gerald.baeza@st.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: add link to stm32mp157 docs
Message-ID: <20190829094458.590884ba@lwn.net>
In-Reply-To: <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
        <20190827074825.64a28e88@lwn.net>
        <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 27 Aug 2019 17:23:30 +0200
Alexandre Torgue <alexandre.torgue@st.com> wrote:

> >> +Datasheet and reference manual are publicly available on ST website:
> >> +.. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
> >> +  
> > 
> > Adding the URL is a fine idea.  But you don't need the extra syntax to
> > create a link if you're not going to actually make a link out of it.  So
> > I'd take the ".. _STM32MP157:" part out and life will be good.
> >   
> 
> We also did it for older stm32 product. Idea was to not have the "full" 
> address but just a shortcut of the link when html file is read. It maybe 
> makes no sens ? (if yes we will have to update older stm32 overview :))

Did you actually run it through Sphinx to see what you get?  If I
understand the effect you're after, you want something like this:

  The datasheet and reference manual are publicly available on
  STM32MP157_.

  .. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html

IOW you have to actually *use* the label you are setting up.  That's a fine
way to do it, I guess, though I'm not really convinced it's better than
just putting the URL in directly.

Thanks,

jon
