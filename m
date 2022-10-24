Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D1FC38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 23:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJXXWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiJXXWi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 19:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726C4275BBB
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 14:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666647798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S479Dg5sGBB/fotobSx8FUYeDMB6rzD4KGpjRiYIypU=;
        b=Ef5x6lQ9Eiv47MaVDftPTe7wZe7DdQ92eIoqNIGhMrH97W4PpfDf2YPp1B9o0hpKg/5rsv
        c8Bsn39NAi1Aw7ov28q+c/fCUSvW80KbxbJrRakYlx819owXMpmxksJwVRKdSn7vBj0PCZ
        btxa6TjmShxyWTnGCksXishXSASjxRA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-IIBElBN3PwqOs0wvZppl4g-1; Mon, 24 Oct 2022 08:01:19 -0400
X-MC-Unique: IIBElBN3PwqOs0wvZppl4g-1
Received: by mail-qk1-f200.google.com with SMTP id bq17-20020a05620a469100b006eeb0bbe02bso8763209qkb.5
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S479Dg5sGBB/fotobSx8FUYeDMB6rzD4KGpjRiYIypU=;
        b=QgVKxQl/0IMgu2MAeGf/eF/DOsYDzggKgssTiZRkwYaFyVsXLJ1Ma8L1Ec9IAU6FMc
         HITZd8fU1hC7JOqUbPTTv0EIPx7MNvXQWD1QkKu6afP/UjTu4dBTDiLdNbKElqeJjNoK
         n9p5kfiQur/0bwAve9r15U9PEdhlpM6Dr8ltg0wfW81K13QyyIu0O+cgbOfFLAwBaGBR
         t/2PFgYnIqoG51X7a0+gd4p40hjSzaYKLaQCaDkJEHoc495TG6hy5QsgPmds3MbJmTap
         hF7jtUjLjnWmC0cpN53QOGe4mEnvTaQ0xWmaK15vY9Z5AmPlIK8fy0/PHrpRdWnfAyVc
         L42w==
X-Gm-Message-State: ACrzQf317yJ1efrDW7B11418Zwb15ExT8fWkAiicPCmWmUMYfg6j+tJ1
        QjVptpBEiw4QSDEsyI0BM1RsPneRAzfdgZSjkVathSeeeEGLlnfXBWk6454uMQX7YFbLnEZ32ZQ
        C5asDDmIF96Z6FahxZUQ3
X-Received: by 2002:a05:620a:e8c:b0:6ee:7820:fa2a with SMTP id w12-20020a05620a0e8c00b006ee7820fa2amr22489993qkm.624.1666612877681;
        Mon, 24 Oct 2022 05:01:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KE6ew29KXR0Yrcpgq8GHmp20ZfeVaOu2QH8p9svifokSCKl53ptU3FYBwzp+lDhOeLp64IQ==
X-Received: by 2002:a05:620a:e8c:b0:6ee:7820:fa2a with SMTP id w12-20020a05620a0e8c00b006ee7820fa2amr22489966qkm.624.1666612877404;
        Mon, 24 Oct 2022 05:01:17 -0700 (PDT)
Received: from [192.168.0.4] ([78.19.70.238])
        by smtp.gmail.com with ESMTPSA id fz24-20020a05622a5a9800b0039cc0fbdb61sm12708997qtb.53.2022.10.24.05.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:01:16 -0700 (PDT)
Message-ID: <aa5f3e2e-10d2-ac78-187e-9aed94b11c0c@redhat.com>
Date:   Mon, 24 Oct 2022 13:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH bpf-next v8 1/1] bpf, docs: document BPF_MAP_TYPE_ARRAY
To:     Donald Hunter <donald.hunter@gmail.com>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     dave@dtucker.co.uk
References: <20221021142259.18093-1-donald.hunter@gmail.com>
 <20221021142259.18093-2-donald.hunter@gmail.com>
Content-Language: en-US
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <20221021142259.18093-2-donald.hunter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21/10/2022 15:22, Donald Hunter wrote:
> |+.. code-block:: c + + int initialize_array(int fd) + { + int ncpus = 
> libbpf_num_possible_cpus(); + long values[ncpus]; + __u32 i, j; + int 
> ret; + + for (i = 0; i < 256 ; i++) { + for (j = 0; j < ncpus; j++) + 
> values[j] = i; + ret = bpf_map_update_elem(fd, &i, &values, BPF_ANY); + 
> if (ret < 0) + return ret; + } + + return ret;|

Reviewed-by: Maryam Tahhan <mtahhan@redhat.com>

