Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F876C77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 13:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjE3NMb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 09:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjE3NM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 09:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D44A1
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685452302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r+6EG5NOedHhUekhNBuWsOrX2N+gdRBd6QiNFzYQtzg=;
        b=VzssYmibBm2bQu7H8LFC/I4fHCvgvV5s5yww5XnnRx7AsbvkevEwzTEfn5cmVs4IbDfPyd
        1MvRx2g6OnwWENm/Tet1k+SdzTs+Fc+ano5uBNUhANmj0+954VxxYilGqQo8zOX45vrd9Q
        /Hx7lbR9YaVuLHpWoOtGucb7pD1b2c4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-ugdCW7PQNbW0ERH3pZKQXw-1; Tue, 30 May 2023 09:11:41 -0400
X-MC-Unique: ugdCW7PQNbW0ERH3pZKQXw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9715654aba1so521160766b.0
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452300; x=1688044300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+6EG5NOedHhUekhNBuWsOrX2N+gdRBd6QiNFzYQtzg=;
        b=Ymxf6Hz8zxAea5K80qKghhWTGeWI52WAirIG3nqn07taLeIDBf2mjv68I73oqw98P/
         5QGlez/qrbTwhrIoGJQzhypbqv8LHGQFx1xBuGwBfu0ZvpfwvT25vdoQeimXNlYNGF9e
         FLSRI/55Glb7gpRDYtX3hSMmDnnYK5TTQT6jv21ekqYRoRRt9o1SQht5QYEuvhT5THiO
         xer/OiJSQSUzzZV/4/mJyKa07B5dlbQKPFhzQ/G9sXIoyQ5W8+HjcWmpN7uDJIZ8T3gB
         aA73iPTLBUAttGDdLXnuLguJiXt65ekNsxDw86+SrZD/1dPCvwua3LQdob0eN44mqZ7H
         BYpQ==
X-Gm-Message-State: AC+VfDwx/sJZxjBFuVUVjA73hx2ehOy0/khuHVLzKqKWIFZbh2/WbIAF
        hDo98TJxaxeMiQEK0uA6rRBfvhk6D1ku6dU6Q40UGH0HFANP1d2I+fzpsBG6i6u2TiM7/VvOQrh
        jIIdQb1pA1KrfLaVcah1b
X-Received: by 2002:a17:907:6292:b0:96f:ddaa:c30d with SMTP id nd18-20020a170907629200b0096fddaac30dmr2358221ejc.26.1685452300001;
        Tue, 30 May 2023 06:11:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rr6tIM5V+1BgGKNSxcvQbqymOEo9kSvokrEaCOceWoHcCAp3vqmzpgpVudXV76YB2ALbsAQ==
X-Received: by 2002:a17:907:6292:b0:96f:ddaa:c30d with SMTP id nd18-20020a170907629200b0096fddaac30dmr2358202ejc.26.1685452299746;
        Tue, 30 May 2023 06:11:39 -0700 (PDT)
Received: from [192.168.0.224] (host-87-12-203-248.business.telecomitalia.it. [87.12.203.248])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906114b00b00965af4c7f07sm7258183eja.20.2023.05.30.06.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:11:39 -0700 (PDT)
Message-ID: <e9ea284d-3a8b-b9ef-d179-b67628771bf4@redhat.com>
Date:   Tue, 30 May 2023 15:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/2] sched/deadline: Fix bandwidth reclaim equation in
 GRUB
To:     Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, luca abeni <luca.abeni@santannapisa.it>
References: <20230526145519.2282062-1-vineeth@bitbyteword.org>
 <20230526172959.5440b9dd@nowhere>
 <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
 <CAO7JXPit6snFM2oW-uSs-mtbmKr9wpbX2exqAUF0iAiaAO6hOg@mail.gmail.com>
 <CAO7JXPgf9ffVQ3n9iD8-1abuDSAZHWAZmz56BmM68uJZ7uy+Uw@mail.gmail.com>
Content-Language: en-US
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <CAO7JXPgf9ffVQ3n9iD8-1abuDSAZHWAZmz56BmM68uJZ7uy+Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/26/23 18:15, Vineeth Remanan Pillai wrote:
> I have just sent the fix as a reply to the initial patch. I shall send a
> v5 if needed. Please let me know.

Please, send a v5... so we avoid mixing up patches on testing.

-- Daniel

