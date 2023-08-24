Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C509C7113B
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 13:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbjHXNC0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 09:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240529AbjHXNCX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 09:02:23 -0400
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD23198B
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 06:02:20 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-ETa1D-A2MPqAaQHtOCMZeg-1; Thu, 24 Aug 2023 09:02:01 -0400
X-MC-Unique: ETa1D-A2MPqAaQHtOCMZeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAA18D40AF;
        Thu, 24 Aug 2023 13:01:57 +0000 (UTC)
Received: from hog (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 29588C1602B;
        Thu, 24 Aug 2023 13:01:56 +0000 (UTC)
Date:   Thu, 24 Aug 2023 15:01:55 +0200
From:   Sabrina Dubroca <sd@queasysnail.net>
To:     Scott Dial <scott@scottdial.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] macsec: introduce default_async_crypto sysctl
Message-ID: <ZOdUw66jbDWE8blF@hog>
References: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
 <20230818184648.127b2ccf@kernel.org>
 <ZOTWzJ4aEa5geNva@hog>
 <a9af0c0a-ec7c-fa01-05ac-147fccb94fbf@scottdial.com>
MIME-Version: 1.0
In-Reply-To: <a9af0c0a-ec7c-fa01-05ac-147fccb94fbf@scottdial.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: queasysnail.net
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2023-08-23, 16:22:31 -0400, Scott Dial wrote:
> > 2023-08-18, 18:46:48 -0700, Jakub Kicinski wrote:
> > > Can we not fix the ordering problem?
> > > Queue the packets locally if they get out of order?
> 
> AES-NI's implementation of gcm(aes) requires the FPU, so if it's busy the
> decrypt gets stuck on the cryptd queue, but that queue is not
> order-preserving.

It should be (per CPU [*]). The queue itself is a linked list, and if we
have requests on the queue we don't let new requests skip the queue.

[*] and if you have packets coming through multiple CPUs at the same
    time, ordering won't be predictable anyway

> I would emphasize
> that benchmarking of network performance should be done by looking at more
> than just the interface frame rate. For instance, out-of-order deliver of
> packets can trigger TCP backoff. I was never interested in how many packets
> the macsec driver could stuff onto the wire, because the impact was my TCP
> socket stalling and my UDP streams being garbled.

Sure. And for iperf3/TCP tests, I'm seeing much better performance out
of async crypto (or much lower CPU utilization for the same throughput
on UDP tests), even with the FPU busy. I decided to go the sysctl
route instead of reverting because I couldn't figure out how to
reproduce the problems you've hit, but I didn't want to just bring
them back for your setup.

> On 8/22/2023 11:39 AM, Sabrina Dubroca wrote:
> > Actually, looking into the crypto API side, I don't see how they can
> > get out of order since commit 81760ea6a95a ("crypto: cryptd - Add
> > helpers to check whether a tfm is queued"):
> > 
> >      [...] ensure that no reordering is introduced because of requests
> >      queued in cryptd with respect to requests being processed in
> >      softirq context.
> > 
> > And cryptd_aead_queued() is used by AESNI (via simd_aead_decrypt()) to
> > decide whether to process the request synchronously or not.
> 
> I have not been following linux-crypto changes, but I would be surprised if
> request is not flagged with CRYPTO_TFM_REQ_MAY_BACKLOG, so it would be

macsec doesn't use CRYPTO_TFM_REQ_MAY_BACKLOG.

> queue. If that's not the case, then the attempt to decrypt would return
> -EBUSY, which would translate to a packet error, since macsec_decrypt MUST
> handle the skb during the softirq.

If we get more packets than we can process, we drop them. I think
that's fine.

> > So I really don't get what commit ab046a5d4be4 was trying to fix. I've
> > never been able to reproduce that issue, I guess commit 81760ea6a95a
> > explains why.
> >
> > I'd suggest to revert commit ab046a5d4be4, but it feels wrong to
> > revert it without really understanding what problem Scott hit and why
> > 81760ea6a95a didn't solve it.
> 
> I don't think that commit has any relevance to the issue. 

It maintains the ordering of requests. If there are async requests
currently waiting to be processed, we don't let requests bypass the
queue until we've drained it.

To make sure, I ran some tests with numbered messages and a patched
kernel that forces queueing decryption every couple of requests, and I
didn't see any reordering.

-- 
Sabrina

