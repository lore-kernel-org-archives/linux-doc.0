Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B07AB7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  1 Aug 2018 22:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbeHBAVD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 1 Aug 2018 20:21:03 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:51187 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726534AbeHBAVD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Aug 2018 20:21:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id D59FA624;
        Wed,  1 Aug 2018 18:33:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 01 Aug 2018 18:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :content-type:date:from:in-reply-to:message-id:mime-version
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=zF7uDRAgqIA2zrTjXON3FjrEdZb849X5ZC+2n9L9PTg=; b=o8hw+aSh
        4ZN9I3r2sZ/dffeY16H0H/8vq8uyvVQDm5uzQ6o5F//BJgMl8koIxmwwlK6O6gvn
        vOHRYwVEoBflzyprLJhWTPcm7MjOMPAop9xqGYsEpMwKqcJ9Cyrfi+WdR9xPA4/1
        GrAKPM1eP5wuazj26ANcxP8Fd1xU7LWBc3gMddjQA465WM6PStljWgiFvKfgTdve
        Ca1+2+gWaYFahDcrL94UqJTrU5NBKb4ntbqNtgFQYAfT0Tlk05UJqr53g7Swse4L
        ZkVJW5ofKJX5CQLbf34nGhj0igCJIn9cBW3VWy0LAFUA7g8GEOSdRTwMHbxYZ765
        uS/3d+JvUQ2bTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=zF7uDRAgqIA2zrTjXON3FjrEdZb84
        9X5ZC+2n9L9PTg=; b=fAhRhRBdGJXu8m4m0j1o+Dx1Vil+SMQSuPv6XEsAP7DOO
        KToTFfHmW56UWFF1u98aU6KZz/GHTQ1NyE6Vor/wzf5ij2Q064EGABkDGw4Yx/uQ
        BBFufptIUg5AGFx/TWy5wdS96eyBr5vN96aqZSTTurR9/6r47tWOJDj5zTkilOLv
        e3PP2QfzzgerScIzpXKEUD3IiSZ0WEcW8qnNvWJVPxZNsLoKqHvdQNrxRmAxg5kc
        N/M5fLUqXg4lD/CZRSFKNZSVSJK9w/GLNDkETKeQB3nGH0A8Al4ox+c8NKF3TsO5
        r9mgqYtCn5UARadXN66DwMoyYv5TPv/e2LC9nOjGA==
X-ME-Proxy: <xmx:HDViW37SgFon3ihArIFJG-vwkOuea2FB4jc9PrjeduvFRoIklcxRMA>
    <xmx:HDViW2a2j9H6gEd4_mBNE-_qkDEMwYbis_wZ8-vQh8H1usb9xRHc-A>
    <xmx:HDViWyt6yyTD4YrutjOs8hhAizB9t3qiWaFNhkmdjIgptDYWyCfGZQ>
    <xmx:HDViW_vwhtLWIS4N1cAhgiobdRRpgEOxUipN6mCftM1GJRxvBmhhkg>
    <xmx:HDViWzptN691nt-bKOj-pELp1pb0UKC-0pLFuRK__J4zv_jlU-NuVQ>
    <xmx:HTViW-7QM9dhhNdLf3ZTlucYNAZinizY2qMExPq2FjwaEnNHOW8kMQ>
X-ME-Sender: <xms:HDViW6ARcidN9ZAgxYJTK-xWv3BUboow0IEhG28CHQuO8rWRQioWag>
Received: from localhost (124-169-17-12.dyn.iinet.net.au [124.169.17.12])
        by mail.messagingengine.com (Postfix) with ESMTPA id D96C41027B;
        Wed,  1 Aug 2018 18:32:59 -0400 (EDT)
Date:   Thu, 2 Aug 2018 08:32:56 +1000
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 03/13] docs: net: Add filter to index toctree
Message-ID: <20180801223256.GB31267@eros>
References: <20180801050908.29970-1-me@tobin.cc>
 <20180801050908.29970-4-me@tobin.cc>
 <20180801075212.6e42fa0c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180801075212.6e42fa0c@lwn.net>
X-Mailer: Mutt 1.9.4 (2018-02-28)
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 01, 2018 at 07:52:12AM -0600, Jonathan Corbet wrote:
> On Wed,  1 Aug 2018 15:08:58 +1000
> "Tobin C. Harding" <me@tobin.cc> wrote:
> 
> > filter.rst was just created (from filter.txt).  We should include it in
> > the networking docs toctree.
> > 
> > Add filter to Documentation/networking/index.rst toctree.
> 
> So...the minorest of nits just to prove that I actually looked at
> this...:)

Thanks for the feedback Jon, I like when I get feedback as apposed to
just patches being applied - makes me feel like the work actually
matters, thanks.

> Adding it to the toctree at this point is going to make the
> docs build messy (OK, even messier than it already is) because the RST
> conversion hasn't really been done yet.  I'd do this at the end of the
> series, just in case somebody, somewhere, is crazy enough to try to
> bisect a docs build.

Will use this method for re-spin of this set and for future conversions.

> Something that's a bit more relevant, perhaps: this document is a bit of
> a mishmash.  It starts by talking about how to use cBPF for socket
> filters, then includes a long discussion about the features of eBPF
> which, as I understand it, is still not accessible to user space for
> socket filters. That latter part certainly merits being in its own file
> where people will actually find it?  And if it were me, I would move that
> file into the core API guide, since it will be relevant beyond networking.

And we have Documentation/bpf as well?  I'll have a go at splitting this
file up and/or moving it around.  The content is pretty heavy so I may
need some comments/ideas from the original authors.

I'll spin up a V2 and we can see how it looks.

thanks,
Tobin.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
