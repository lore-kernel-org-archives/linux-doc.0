Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F6DC27C40
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 20:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbjHWU2I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 16:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbjHWU2B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 16:28:01 -0400
X-Greylist: delayed 324 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Aug 2023 13:27:59 PDT
Received: from mail.scottdial.com (bert.scottdial.com [104.237.142.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A9210C7;
        Wed, 23 Aug 2023 13:27:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.scottdial.com (Postfix) with ESMTP id A119E111B49E;
        Wed, 23 Aug 2023 16:22:33 -0400 (EDT)
Received: from mail.scottdial.com ([127.0.0.1])
        by localhost (mail.scottdial.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id UQH3nC_IfCdB; Wed, 23 Aug 2023 16:22:32 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.scottdial.com (Postfix) with ESMTP id 0AC44111B0C2;
        Wed, 23 Aug 2023 16:22:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.scottdial.com 0AC44111B0C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scottdial.com;
        s=24B7B964-7506-11E8-A7D6-CF6FBF8C6FCF; t=1692822152;
        bh=4ro6skDZPhNFiMNcHq20oe+J8XwK1HUQS3NB15eFkJY=;
        h=Message-ID:Date:MIME-Version:To:From;
        b=yEqAvoZFxTwcGOciJVr6R0XxP7RxINnUUet34rKL5zHpOpL7YpkHO8QkeWYAjSGkz
         iFOnZATQ2tpnfD3OnCiwScFdVRMacHed37epCFpzAMDplQqU0/zMZIcbJD116ntFmD
         FWU5+f6ikFCWaMgCq2r3/9nbt7E35rGr5dl9cxU0HrOmJXru9JuGJYhi+pyAoq+jr9
         6xeMSt778MK0ljTxK/CbLq7XBNiUaX68n3w1NM2MsQw7fbVMXqHdcHn3pTginLWE/X
         j6w+aLOxbOGQ2aWvR8D+OOXR0DxDVP5TDehHgg1ni89A7l+xuwdbJ9PzNIw7wKokaS
         G9BXRwnzTO8HA==
X-Virus-Scanned: amavisd-new at scottdial.com
Received: from mail.scottdial.com ([127.0.0.1])
        by localhost (mail.scottdial.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 4nDsxhdqy-ZN; Wed, 23 Aug 2023 16:22:31 -0400 (EDT)
Received: from [172.17.2.2] (unknown [172.17.2.2])
        by mail.scottdial.com (Postfix) with ESMTPSA id D4BBC111B49E;
        Wed, 23 Aug 2023 16:22:31 -0400 (EDT)
Message-ID: <a9af0c0a-ec7c-fa01-05ac-147fccb94fbf@scottdial.com>
Date:   Wed, 23 Aug 2023 16:22:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next] macsec: introduce default_async_crypto sysctl
Content-Language: en-US
To:     Sabrina Dubroca <sd@queasysnail.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
 <20230818184648.127b2ccf@kernel.org> <ZOTWzJ4aEa5geNva@hog>
From:   Scott Dial <scott@scottdial.com>
In-Reply-To: <ZOTWzJ4aEa5geNva@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> 2023-08-18, 18:46:48 -0700, Jakub Kicinski wrote:
>> Can we not fix the ordering problem?
>> Queue the packets locally if they get out of order?

AES-NI's implementation of gcm(aes) requires the FPU, so if it's busy 
the decrypt gets stuck on the cryptd queue, but that queue is not 
order-preserving. If the macsec driver maintained a queue for the netdev 
that was order-preserving, then you could resolve the issue, but it adds 
more complexity to the macsec driver, so I assume that's why the 
maintainers have always desired to revert my patch instead of ensuring 
packet order.

With respect to AES-NI's implementation of gcm(aes), it's unfortunate 
that there is not a synchronous version that uses the FPU when available 
and fallsback to gcm_base(ctr(aes-aesni),ghash-generic) when it's not. 
In that case, you would get the benefit of the FPU for the majority of 
time when it's available. When I suggested this to linux-crypto, I was 
told that relying on synchronous crypto in the macsec driver was wrong:

On 12 Aug 2020 10:45:00 +0000, Pascal Van Leeuwen wrote:
> Forcing the use of sync algorithms only would be detrimental to platforms
> that do not have CPU accelerated crypto, but do have HW acceleration
> for crypto external to the CPU. I understand it's much easier to implement,
> but that is just being lazy IMHO. For bulk crypto of relatively independent
> blocks (networking packets, disk sectors), ASYNC should always be preferred.

So, I abandoned my suggestion to add a fallback. The complexity of the 
queueing the macsec driver was beyond the time I had available, and the 
regression in performance was not significant for my use case, but I 
understand that others may have different requirements. I would 
emphasize that benchmarking of network performance should be done by 
looking at more than just the interface frame rate. For instance, 
out-of-order deliver of packets can trigger TCP backoff. I was never 
interested in how many packets the macsec driver could stuff onto the 
wire, because the impact was my TCP socket stalling and my UDP streams 
being garbled.

On 8/22/2023 11:39 AM, Sabrina Dubroca wrote:
> Actually, looking into the crypto API side, I don't see how they can
> get out of order since commit 81760ea6a95a ("crypto: cryptd - Add
> helpers to check whether a tfm is queued"):
> 
>      [...] ensure that no reordering is introduced because of requests
>      queued in cryptd with respect to requests being processed in
>      softirq context.
> 
> And cryptd_aead_queued() is used by AESNI (via simd_aead_decrypt()) to
> decide whether to process the request synchronously or not.

I have not been following linux-crypto changes, but I would be surprised 
if request is not flagged with CRYPTO_TFM_REQ_MAY_BACKLOG, so it would 
be queue. If that's not the case, then the attempt to decrypt would 
return -EBUSY, which would translate to a packet error, since 
macsec_decrypt MUST handle the skb during the softirq.

> So I really don't get what commit ab046a5d4be4 was trying to fix. I've
> never been able to reproduce that issue, I guess commit 81760ea6a95a
> explains why.
 >
 > I'd suggest to revert commit ab046a5d4be4, but it feels wrong to
 > revert it without really understanding what problem Scott hit and why
 > 81760ea6a95a didn't solve it.

I don't think that commit has any relevance to the issue. For instance 
with AES-NI, you need to have competing load on the FPU such that 
crypto_simd_usable() fails to be true. In the past, I replicated this 
failure mode using two SuperMicro 5018D-FN4T servers directly connected 
to each other, which is a Xeon-D 1541 w/ Intel 10GbE NIC (ixgbe driver). 
 From there, I would send /dev/urandom as UDP to the other host. I would 
get about 1 out of 10k packets queued on cryptd with that setup. My real 
world case was transporting MPEG TS video streams, each about 1k pps, so 
that is an decode error in the video stream every 10 seconds.

-- 
Scott Dial
scott@scottdial.com

