Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC90BC3DA66
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 01:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbjHRBiC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 21:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357092AbjHRBhy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 21:37:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE35EE48
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 18:37:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26485628AC
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 01:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7F1C433C8;
        Fri, 18 Aug 2023 01:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692322672;
        bh=Bh5spccamtzHLoUmXeOIpW1XMXkFhUqPZ0TzEoOACAA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sXkJEXzZ4PI/kujyzPDj/r7yD8X7AYZKGex8C27tRd84jvnY4/Ks3ufKXX9OMfI1j
         uXs2rjTVPrry6vi6qnnvnfqJ8t+GCVcjJlLY6CKE0xIu17F9dyVzwgcHWP/v0mgQvU
         H8R1JJWidKgwfaYVjey2h0A2IAie9aOlfyGhpLRnTTmgyAbgSsU7o30rdMQllbWEvP
         JHPt991IUBtPGMyu4t9xnkqSTykHOA+nX8JaFg3j8nJUnMHGeIAA3SUgq3wMHtJhuZ
         uHlkikncBbQdD8hkOqgsjJRESEz2NeSUYKQaI2nyTEsoGbbKqdjnUnduA5dLAMPy+w
         d3ap4a4EtQWLg==
Date:   Thu, 17 Aug 2023 18:37:51 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@redhat.com>
Cc:     Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: Re: [PATCH net-next v2 05/10] tools/net/ynl: Refactor
 decode_fixed_header into NlMsg
Message-ID: <20230817183751.194d547a@kernel.org>
In-Reply-To: <CAAf2yc=C4N=QT6hpxmLi-uywc+MhuLdAsbfPRORv5ms9k1JAfQ@mail.gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-6-donald.hunter@gmail.com>
        <20230816082030.5c716f37@kernel.org>
        <CAAf2yc=C4N=QT6hpxmLi-uywc+MhuLdAsbfPRORv5ms9k1JAfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Aug 2023 16:14:35 +0100 Donald Hunter wrote:
> > It's a bit of a layering violation that we are futzing with the raw
> > member of NlMsg inside GenlMsg, no?
> >
> > Should we add "fixed hdrs len" argument to NlMsg? Either directly or
> > pass ynl and let get the expected len from ynl? That way NlMsg can
> > split itself into hdr, userhdrs and attrs without GenlMsg "fixing it
> > up"?  
> 
> I agree, it breaks the layering. The issue is that GenlMsg gets created at
> some point after NlMsg, only when we know the nl_msg is suitable for
> decoding. The fixed header bit is quite well encapsulated in NlMsg,
> it's the genl header that needs pulled out and NlMsg shouldn't know
> anything about it. How about I add a take_bytes(length) method or a
> generic decode_subheader(format, length) method to NlMsg?

Why do we need to fix up the .raw of NlMsg underlying the GenlMsg
in the first place? GenlMsg by itself didn't need to do that until now.

Another option to consider which would make things more symmetric
between raw and genetlink would be to add a wrapper class for old
families, too. ClassicMsg? CnlMsg? That way we could retain the
separation of NlMsg is just a raw message which could be a NLM_DONE or
some other control thing, and higher level class being used to pull
fixed headers and separate out attrs. Just a thought, not sure it helps.
