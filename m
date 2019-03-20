Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0841E7D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 20:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfCTU7g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 16:59:36 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:33313 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfCTU7g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 16:59:36 -0400
Received: by mail-yw1-f65.google.com with SMTP id a199so3195026ywa.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Mar 2019 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dlgp2MdnsREd+nc4jSTOXVYFicF0JfUh7ydGu+tAmLg=;
        b=YFtoHdtQVZ9UvOqKhzJE/FYr9snrw4U6DTalkvSVji/qTo+Xewly3DaO54P3LXZ00N
         DCkyCPgHLU6+6peHoQGzFBSNMQ1D4WoC/K1tOo2p1k1QMllPOcX8vSVwg9ot+itOWnBs
         MFSu8ao8DVt34JuqAB4FTA2K8AzQbqj4tAMwjc16oPP9nyN3gqyDdycq/R2eLmQM1eCm
         CnCh36QBmpaU1h3lP7b4Ro7nEi9FuAIhuZCMDi2tUulho3iic+3sgGjB6yCKgjn0ex4S
         yCIqdP/J6iBjKtO2cK0DNc80TYtqEbIYBWvnXXYaQEyWh5PpPvvGz5YB8bpekTOlJPAr
         wsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dlgp2MdnsREd+nc4jSTOXVYFicF0JfUh7ydGu+tAmLg=;
        b=iaLUxse7oqMjIuyQZdvhjH63UGCja58SiYo+p5beqwsb03dt1OVUycrsG0KZp8qEk/
         3A2okRFX0PCRRSmnV0JmxqmuLYU1fqq6KAV1qU4RgeFexb1jD5BmN2FiVdijXfabsraB
         qSNwOFjc6b8Q0rHfdOlu8poprMgOhKcZyXTX67cueRFgz3FrINMKmbUxpy9TecFaPIoV
         QCnDWoq8kJwBQLLL5KsxVjmQAComTXvKqAI6j35hCRQK8nDMHwSU/erG5bihGZF4b2Wu
         71B3bd39Xc2BKHDB1AKMhD2FZ7fyABHPywCZ/ZpLW9YiFL6Hsobm2ZMBRHR4W98QzgTM
         JMVQ==
X-Gm-Message-State: APjAAAX3hEluxlqTGB7JTy4GHmEp8WXg46TRO91Gl4yIlKxgHGi/LkzZ
        xfIw14PE5/dkttSxT6y2TscaGQ==
X-Google-Smtp-Source: APXvYqzXoLupL+n72SdHmbmKb5aynrZfObbwlDHWH7olugK1jMsRTp+3aMDyANbp/+KSCDMMXL6v6A==
X-Received: by 2002:a25:e54a:: with SMTP id c71mr6067ybh.336.1553115557703;
        Wed, 20 Mar 2019 13:59:17 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:b52c])
        by smtp.gmail.com with ESMTPSA id s18sm974233ywg.100.2019.03.20.13.59.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 13:59:16 -0700 (PDT)
Date:   Wed, 20 Mar 2019 16:59:15 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     gregkh@linuxfoundation.org, tj@kernel.org, lizefan@huawei.com,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 4/7] psi: split update_stats into parts
Message-ID: <20190320205915.GC19382@cmpxchg.org>
References: <20190319235619.260832-1-surenb@google.com>
 <20190319235619.260832-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319235619.260832-5-surenb@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 19, 2019 at 04:56:16PM -0700, Suren Baghdasaryan wrote:
> Split update_stats into collect_percpu_times and update_averages for
> collect_percpu_times to be reused later inside psi monitor.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
