Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AA7C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 16:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382498AbiEMQu3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 May 2022 12:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382535AbiEMQuB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 May 2022 12:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8347D12616
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652460597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bi+uH/wZS5AkNpz5xFa5gSB6zQd3C6hwa/ddsG2FtDA=;
        b=a47/KYRr6cBgnQQlZHPRHNbpd9mUZFyoEw4qSN7aRASOoVRmCpt5S+5li+dzVQowZ/79dA
        myBgUTehEmPsZJuyl0XH7wC0eFO2XnMa3QoVgPSR+ufwBmGcY7Vk49KOQ/TWqmIRjL8/B7
        e8nA/HDpBYIYFAEmqrWnqzV2o1a16Jo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-fiM_V-UTOIGwMHehfR96rg-1; Fri, 13 May 2022 12:49:55 -0400
X-MC-Unique: fiM_V-UTOIGwMHehfR96rg-1
Received: by mail-qk1-f197.google.com with SMTP id z12-20020ae9e60c000000b006a0e769f9caso6098326qkf.5
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bi+uH/wZS5AkNpz5xFa5gSB6zQd3C6hwa/ddsG2FtDA=;
        b=yt9bmwGZbYyeyV+VQfYZGTMFYM2R1b1rCdanHEQ62vKqPMCoQHEiZrYRzbtIGpdNSo
         Uyy847tFKZ3y3NWu22BXjnr9hrZf8DVRNbT5SMaGqCH+hVpIvPv67Cs5KIycTlb9GGG5
         MGq18DcIsJehHCSpTxjayNWMzxHqN+tY4J9phlCt8yTqd/MaQpatJoH+EZn2kf9VCVz8
         /93g+ksDYHfi872Cbli4uDEspAcg8+Iltaq3WFwMx0MWmt97rR4r3dTLyY6vEv+UAFdk
         AIq7UDNXH4PSRBtPvHmCb/Hj6ih+ABih2AouVKhRU/ZflupF0bPNjsMg4IplqDkMWBoX
         Ui0g==
X-Gm-Message-State: AOAM530l8Cu+QuSJvFB2mZrJzYZboLHWgD0NyScAD4iy4LR+vE9moaom
        TBmEQg1VpdFDPHgAjhJhv+ZKi0Ut2MmF/uHLvKTi1wYF4CVX6+CgJrLopF3GbH5Yuw9ZB7OtpdS
        XJaCMNTZgIuldIzRrfh4E
X-Received: by 2002:a05:6214:2ae:b0:456:31d0:c934 with SMTP id m14-20020a05621402ae00b0045631d0c934mr5225767qvv.45.1652460595250;
        Fri, 13 May 2022 09:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI2ye9002PK1A/FFBokk0XBX5unmGHGn9kZdogb2kLQ6lGa3MMkjD6ex9Rgz46yWo7gXRvmA==
X-Received: by 2002:a05:6214:2ae:b0:456:31d0:c934 with SMTP id m14-20020a05621402ae00b0045631d0c934mr5225747qvv.45.1652460594963;
        Fri, 13 May 2022 09:49:54 -0700 (PDT)
Received: from [192.168.98.18] ([107.15.110.69])
        by smtp.gmail.com with ESMTPSA id bj31-20020a05620a191f00b0069fc13ce22asm1750937qkb.91.2022.05.13.09.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 09:49:54 -0700 (PDT)
Message-ID: <1d52f228-ea8c-6d97-13b6-8ec912188e07@redhat.com>
Date:   Fri, 13 May 2022 12:49:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH net-next v2] bond: add mac filter option for balance-xor
Content-Language: en-US
To:     Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
Cc:     Long Xin <lxin@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Veaceslav Falico <vfalico@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
References: <6227427ef3b57d7de6d4d95e9dd7c9b222a37bf6.1651689665.git.jtoppins@redhat.com>
 <f85a0a66-d3b8-9d20-9abb-fc9fa5e84eab@blackwall.org>
 <d2696dab-2490-feb5-ccb2-96906fc652f0@redhat.com>
 <e29f8d2a-f9b3-36d3-13aa-d5bec16cf61b@blackwall.org>
From:   Jonathan Toppins <jtoppins@redhat.com>
In-Reply-To: <e29f8d2a-f9b3-36d3-13aa-d5bec16cf61b@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/13/22 12:19, Nikolay Aleksandrov wrote:
> On 13/05/2022 18:42, Jonathan Toppins wrote:
>> Hi Nik, thanks for the review. Responses below.
>>
>> On 5/5/22 08:14, Nikolay Aleksandrov wrote:
>>> On 04/05/2022 21:47, Jonathan Toppins wrote:
>>>> Implement a MAC filter that prevents duplicate frame delivery when
>>>> handling BUM traffic. This attempts to partially replicate OvS SLB
>>>> Bonding[1] like functionality without requiring significant change
>>>> in the Linux bridging code.
>>>>
>>>> A typical network setup for this feature would be:
>>>>
>>>>               .--------------------------------------------.
>>>>               |         .--------------------.             |
>>>>               |         |                    |             |
>>>>          .-------------------.               |             |
>>>>          |    | Bond 0  |    |               |             |
>>>>          | .--'---. .---'--. |               |             |
>>>>     .----|-| eth0 |-| eth1 |-|----.    .-----+----.   .----+------.
>>>>     |    | '------' '------' |    |    | Switch 1 |   | Switch 2  |
>>>>     |    '---,---------------'    |    |          +---+           |
>>>>     |       /                     |    '----+-----'   '----+------'
>>>>     |  .---'---.    .------.      |         |              |
>>>>     |  |  br0  |----| VM 1 |      |      ~~~~~~~~~~~~~~~~~~~~~
>>>>     |  '-------'    '------'      |     (                     )
>>>>     |      |        .------.      |     ( Rest of Network     )
>>>>     |      '--------| VM # |      |     (_____________________)
>>>>     |               '------'      |
>>>>     |  Host 1                     |
>>>>     '-----------------------------'
>>>>
>>>> Where 'VM1' and 'VM#' are hosts connected to a Linux bridge, br0, with
>>>> bond0 and its associated links, eth0 & eth1, provide ingress/egress. One
>>>> can assume bond0, br1, and hosts VM1 to VM# are all contained in a
>>>> single box, as depicted. Interfaces eth0 and eth1 provide redundant
>>>> connections to the data center with the requirement to use all bandwidth
>>>> when the system is functioning normally. Switch 1 and Switch 2 are
>>>> physical switches that do not implement any advanced L2 management
>>>> features such as MLAG, Cisco's VPC, or LACP.
>>>>
>>>> Combining this feature with vlan+srcmac hash policy allows a user to
>>>> create an access network without the need to use expensive switches that
>>>> support features like Cisco's VCP.
>>>>
>>>> [1] https://docs.openvswitch.org/en/latest/topics/bonding/#slb-bonding
>>>>
>>>> Co-developed-by: Long Xin <lxin@redhat.com>
>>>> Signed-off-by: Long Xin <lxin@redhat.com>
>>>> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
>>>> ---
>>>>
>>>> Notes:
>>>>       v2:
>>>>        * dropped needless abstraction functions and put code in module init
>>>>        * renamed variable "rc" to "ret" to stay consistent with most of the
>>>>          code
>>>>        * fixed parameter setting management, when arp-monitor is turned on
>>>>          this feature will be turned off similar to how miimon and arp-monitor
>>>>          interact
>>>>        * renamed bond_xor_recv to bond_mac_filter_recv for a little more
>>>>          clarity
>>>>        * it appears the implied default return code for any bonding recv probe
>>>>          must be `RX_HANDLER_ANOTHER`. Changed the default return code of
>>>>          bond_mac_filter_recv to use this return value to not break skb
>>>>          processing when the skb dev is switched to the bond dev:
>>>>            `skb->dev = bond->dev`
>>>>
>>>>    Documentation/networking/bonding.rst  |  19 +++
>>>>    drivers/net/bonding/Makefile          |   2 +-
>>>>    drivers/net/bonding/bond_mac_filter.c | 201 ++++++++++++++++++++++++++
>>>>    drivers/net/bonding/bond_mac_filter.h |  39 +++++
>>>>    drivers/net/bonding/bond_main.c       |  27 ++++
>>>>    drivers/net/bonding/bond_netlink.c    |  13 ++
>>>>    drivers/net/bonding/bond_options.c    |  86 ++++++++++-
>>>>    drivers/net/bonding/bonding_priv.h    |   1 +
>>>>    include/net/bond_options.h            |   1 +
>>>>    include/net/bonding.h                 |   3 +
>>>>    include/uapi/linux/if_link.h          |   1 +
>>>>    11 files changed, 390 insertions(+), 3 deletions(-)
>>>>    create mode 100644 drivers/net/bonding/bond_mac_filter.c
>>>>    create mode 100644 drivers/net/bonding/bond_mac_filter.h
>>>>
>>>
>>> Hi Jonathan,
>>> I must mention that this is easily solvable with two very simple ebpf programs, one on egress
>>> to track source macs and one on ingress to filter them, it can also easily be solved by a
>>> user-space agent that adds macs for filtering in many different ways, after all these VMs
>>> run on the host and you don't need bond-specific knowledge to do this. Also you have no visibility
>>> into what is currently being filtered, so it will be difficult to debug. With the above solutions
>>> you already have that. I don't think the bond should be doing any learning or filtering, this is
>>> deviating a lot from its purpose and adds unnecessary complexity.
>>> That being said, if you decide to continue with the set, comments are below...
>>
>> This is an excellent observation, it does appear this could likely be done with eBPF. However, the delivery of such a solution to a user would be the difficult part. There appears to be no standard way for attaching a program to an interface, it still seems customary to write your own custom loader. Where would the user run this loader? In Debian likely in a post up hook with ifupdown, in Fedora one would have to write a locally custom dispatcher script (assuming Network Manager) that only ran the loader for a given interface. In short I do not see a reasonably appropriate way to deploy an eBPF program to users with the current infrastructure. Also, I am not aware of the bpf syscall supporting signed program loading. Signing kernel modules seems popular with some distros to identify limits of support and authentication of an unmodified system. I suspect similar bpf support might be needed to identify support and authentication for deployed programs.
>>
> 
> A great deal of the distributions (almost all major ones) out there already use eBPF for various tasks, so I can't see
> how any of these arguments apply nowadays. There are standard ways to load eBPF programs that have been around
> for quite some time and most of the different software needed to achieve that is already packaged
> for all major distributions (and has been for a long time). Anyway getting into the details of "how" the user would load the program
> is not really pertinent to the discussion, that doesn't warrant adding so much new complexity in the bonding driver
> which will have to be maintained forever. Honestly, I don't like the idea of adding learning to the bonding at all,
> I think it's the wrong place for it, especially when the solution can easily be achieved with already available means.
> It might not even be eBPF, you can do it with a user-space agent that uses nftables or some other filtering mechanism,
> I'm sure you can think of many other ways to solve it which don't require this new infrastructure. All of these ways
> to solve it have many advantages over this (e.g. visibility into the current entries being filtered, control over them and so on).
> 
> That's my opinion of course, it'd be nice to get feedback from others as well.

Input from others would be helpful, I cannot claim eBPF is an inferior 
technical solution to this proposed solution. So if this bonding option 
approach is the wrong path, would like to know sooner rather than later 
to attempt another path. I am by no means an expert on eBPF, I know how 
to spell it, I do know there were support issues when considering the 
eBPF option.

I will post my v3 to continue the technical review, but I think the 
"should we even do this" review should be continued here.

-Jon

