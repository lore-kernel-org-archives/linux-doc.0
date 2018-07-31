Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60A7E7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 13:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732233AbeGaPao (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 11:30:44 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33470 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732202AbeGaPan (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 11:30:43 -0400
Received: by mail-wm0-f66.google.com with SMTP id r24-v6so11107664wmh.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Jul 2018 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cumulusnetworks.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PPGxjsl80VQ+AXitRpylhdjkvoTQYArSeA+7SpUh9d0=;
        b=SmAph5/HV78TIDkxrkoX7KNhLuFp5MG+sYqaQbD+iFk+AUCMSmwlYHL5koY9NGvkcz
         ZzDadkefpcFfA0MC+8XQ/0HjLrf9WliWySM/+KqVIPi95M3XeUxeCpUGId194O5JAm0M
         v5scd/jIqzLtbEjk6Mtc5Grg4on8avZaW3V/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PPGxjsl80VQ+AXitRpylhdjkvoTQYArSeA+7SpUh9d0=;
        b=i2qT34xR3GzS7jiJuH50cvNmSUpwehmeB8zlphJuFcsp0SjdwbgwZ/sI+AbLzAzOQh
         6Ez5DnkY2+2FtR2Wh8mSpPTEepUlWoEY6C2HICUV1nllYYyiivgsRavnpcTAXS2KjNnV
         V8HMCM0rRRktRSPiv6s4o9CoRVu2JFKq6iVRCGo1PrsTAAQfjxTg5N9NJJEt2xEVhvgj
         5DLkxZqQc6uzKiA2vp1g4GVVrl01IZjHRTtEnk3Ir/fxHgJ5uAwu4Ee1wk5+DKHXbJDr
         YC9qSBP1RTn1dhGEy/9xKVMKd6vvMNHde5MN/v/QPQVY2KOE1K0wHmeAQBZ/Y7GNs69D
         midg==
X-Gm-Message-State: AOUpUlG6hlR5PWNfN+3m2LOnpXIJUtnKFSl/dMLxtghYCsPMp91R5gPE
        bV9CBc1TPmBGHtW0zhfSO0iL1Q==
X-Google-Smtp-Source: AAOMgpfpE4U6SobZUjhfZ/d3jWEf4FIWuuir3UaCJPP1NmbC8ZFEpy0h5+RsAk4Jfdm75axS3PwSlQ==
X-Received: by 2002:a1c:e041:: with SMTP id x62-v6mr2191337wmg.155.1533045016687;
        Tue, 31 Jul 2018 06:50:16 -0700 (PDT)
Received: from [192.168.0.101] ([79.134.172.114])
        by smtp.googlemail.com with ESMTPSA id j11-v6sm14597258wrr.37.2018.07.31.06.50.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jul 2018 06:50:15 -0700 (PDT)
Subject: Re: [PATCH net-next 1/7] net: ipv4: Control SKB reprioritization
 after forwarding
To:     Petr Machata <petrm@mellanox.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, dsahern@gmail.com
References: <cover.1533030830.git.petrm@mellanox.com>
 <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
From:   Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Message-ID: <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
Date:   Tue, 31 Jul 2018 16:50:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/31/2018 12:56 PM, Petr Machata wrote:
> After IPv4 packets are forwarded, the priority of the corresponding SKB
> is updated according to the TOS field of IPv4 header. This overrides any
> prioritization done earlier by e.g. an skbedit action or ingress-qos-map
> defined at a vlan device.
...
> diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> index 661348f23ea5..e47503b4e4d1 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -98,6 +98,7 @@ struct netns_ipv4 {
>  	int sysctl_ip_default_ttl;
>  	int sysctl_ip_no_pmtu_disc;
>  	int sysctl_ip_fwd_use_pmtu;
> +	int sysctl_ip_fwd_update_priority;
>  	int sysctl_ip_nonlocal_bind;
>  	/* Shall we try to damage output packets if routing dev changes? */
>  	int sysctl_ip_dynaddr;
> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> index f2a0a3bab6b5..d3cfbd89ca3a 100644
> --- a/net/ipv4/af_inet.c
> +++ b/net/ipv4/af_inet.c
> @@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
>  	 * We set them here, in case sysctl is not compiled.
>  	 */
>  	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
> +	net->ipv4.sysctl_ip_fwd_update_priority = true;

nit: since this is an int and to keep the code style of inet_init_net()
     I'd suggest to use 1 instead

>  	net->ipv4.sysctl_ip_dynaddr = 0;
>  	net->ipv4.sysctl_ip_early_demux = 1;
>  	net->ipv4.sysctl_udp_early_demux = 1;
...

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
