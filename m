Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D579C7E8B9
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752770AbeDINdK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:33:10 -0400
Received: from mail-wm0-f51.google.com ([74.125.82.51]:52994 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752140AbeDINdG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 09:33:06 -0400
Received: by mail-wm0-f51.google.com with SMTP id g8so19112359wmd.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O+YqI80XsYL7ErbgUwEV/ofOiSVYhWZ+CaYVyNYxOes=;
        b=Gn2VUBW/jy7L3D97lehVzE87Y+9SlT311ugxcRfnPkO3yuVsxkX+s3jyDSt4wcKCZR
         H9GY8W09VgMPq1LJ+N152i2o6xq78AGUGN1W7Ah0Xttz98HLSeZtnJqKY5x2FzLC4sz9
         A3FmhdVE4AryusPfWDB6p48xMMfKoQLAHhMNoPhuPX6TJE0RhkwBcGPdO5VhppiYByLp
         HFSwrA9rnyOfEupufjDVuMr7YtCf+q90KeTsoSFlxJTVqezf3mxjJs37l7nXJ4XyHlEW
         KGjh40Q7Ne5WbJ7x2a1juruxSQkhkh5Q5ySskw6kj6Ym4xpPcz/mKwWdABunqXxCQSza
         S8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O+YqI80XsYL7ErbgUwEV/ofOiSVYhWZ+CaYVyNYxOes=;
        b=BS73ucNgsiE/ITlMQeu2IrbYDmaq9q0MP2WTK3YKx46XPpyq7f0uv5crf39C69BhWh
         RaOAx7v8syR4bqHj+Ul0vMnfMegugV2N2aS7rU2tn/8+R6Fw4xcvsTt1IkaIpvh6Ue+p
         1Pg8mRa1iZsfrrzS9cIAoHR5xiYJlJjkGNcqWDJN0Qa0kV0GnFxbLiuGZkiU8QyCw5up
         vvD2bO3gCycCGMxIjnbXzdRUTEeGqtFEm9Nva+b1Bn0oE94tS8QhJEEgU0Pzlll0RJBM
         Cw88Od+E9ouMFB9ZUeoh87ayPmTiZCzoVtNysp5EN3vQVN7GiNvciqyAnUd66BIYfYBP
         J1Lw==
X-Gm-Message-State: ALQs6tDkPu4IfWXLFZLGaJHPUQmuIYw3Scfhluf/rj8APYZIqKbqLfSK
        SMnpzDKTJ/9TaN7d/Hee/Z8ExQ==
X-Google-Smtp-Source: AIpwx49DunKiD2Rcr46eKzznqeoqP47pewrPGHH41+tqW7XrlKB4gelF0t9MAA/FUJbJ4I+bDWcjvQ==
X-Received: by 10.80.137.245 with SMTP id h50mr22699368edh.39.1523280784898;
        Mon, 09 Apr 2018 06:33:04 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id s21sm351210edd.96.2018.04.09.06.33.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Apr 2018 06:33:04 -0700 (PDT)
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
To:     Markus Heiser <markus.heiser@darmarit.de>,
        Daniel Borkmann <daniel@iogearbox.net>
Cc:     Jonathan Corbet <corbet@lwn.net>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
 <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
 <C6491E01-3FC2-4AC4-8190-7B17CFAC01AD@darmarit.de>
 <b2fbd09d-7ba2-9884-e18d-eac586af1665@iogearbox.net>
 <550CD0C6-10B5-4C8C-9C1E-70AA61ABDC34@darmarit.de>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <c8715de7-674e-64e0-1e3b-4b4e884e80ad@netronome.com>
Date:   Mon, 9 Apr 2018 14:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <550CD0C6-10B5-4C8C-9C1E-70AA61ABDC34@darmarit.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-09 12:52 UTC+0200 ~ Markus Heiser <markus.heiser@darmarit.de>
> 
>> Am 09.04.2018 um 12:08 schrieb Daniel Borkmann <daniel@iogearbox.net>:
> [...]
> 
>>> May I completely misunderstood you, so correct my if I'am wrong:
>>>
>>> - ./scripts/bpf_helpers_doc.py : produces reST markup from C-comments
>>> - ./scripts/kerne-doc          : produces reST markup from C-comments
>>>
>>> IMO: both are doing the same job, so why not using kernel-doc?
>>
>> They are not really doing the same job, in bpf_helpers_doc.py case you don't
>> want the whole header rendered, but just a fraction of it, that is, the
>> single big comment which describes all BPF helper functions that a BPF
>> program developer has available to use in user space - aka the entries in
>> the __BPF_FUNC_MAPPER() macro;
> 
> 
>> I also doubt the latter would actually qualify
>> in kdoc context as some sort of a function description.
> 
> latter .. ah, OK .. thanks for clarifying. 
> 
> -- Markus --

As Daniel explained, kernel-doc does not apply in this case, we do not
have the full function prototype for eBPF helpers in the header file.
But to be honest, I didn't even realise kernel-doc was available and
could do something close to what I was looking for, so thanks for your
feedback! :)

Quentin

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
