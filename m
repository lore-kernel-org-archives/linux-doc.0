Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5EE07D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 16:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfKMQbk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 11:31:40 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:45310 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbfKMQbk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Nov 2019 11:31:40 -0500
Received: by mail-ua1-f43.google.com with SMTP id j4so844899uak.12
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2019 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=tqMvp6R7Yw4SmAq29b12cUx08kJZaFb2aktgCaRidVg=;
        b=VQG9GuAhCkrExq0QANlUbr2B7WTTZ7334zQJyl+Wsbbq14nNkc9fkY4Y+tWBCLO2G2
         i3PdOC3wkK81IONAn0hUurXKjI04fcEByfmpOZ6Dxe5/JKB+Ub8YqD3s6msojAKgbs8q
         ktakkePKYuWZkFopjxa/d4TqB4xT8MoWzgc2QZQrZwkIJ4yzpJz9qlZhbqx4kTfkpyzA
         eIqWCQDdycQ4m2/hXDYukiLqQZfVWFCJjtO3+CRQqC8SUEX8bQLA9guRVjloWg+bLi0Y
         G9fbrRy1PHJdxI034dXFg9TdbJom0KIIFxs8k0RnDJWtgdxO9dmwIAoK4BfsZLvUwSGy
         Nuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=tqMvp6R7Yw4SmAq29b12cUx08kJZaFb2aktgCaRidVg=;
        b=d/zmr4dI59TBu3GRz63ODt2rygFp1HZq+IzCwNu+QEZGW+67vR6ONKtXcJ3Jtf4uoT
         h6wU6/nBJsYxXXauBm3F4pOC6rL5vj/VTyi7rE7gsV92OFlzHmSdtXhDHyQsvQ8Olv76
         fe1yp6aXBbDguiPBpPUCn2Vic7W/UFUr9KlZBNumKk9yQNdrXrEQehiwKq/OS1JJTlrs
         ho6vNB4NZT8ja863khCCgSb7OcUhDkf2yiZYle861n7E/4mAF2Kfan+kYGMmh8tQOsZV
         iXiZElIwy36JbnhErfl8tFkxXM4dIa5c8PA5LHlZg3rlTnobb5s5/GNz276fx3HNTZvl
         2C9A==
X-Gm-Message-State: APjAAAUxYZSNjZlT0sZlEe0C4kmKPRZ4djPw3Mj3JKh2Q1fBAC/DsWak
        9NAjD5xuNxXAfk1oemGpFFkrVQ==
X-Google-Smtp-Source: APXvYqzw2u4dm/fB/qFWlfB4/plMZGq4mipiSczyOQ19AQjDIj6sE0HXwvqWXTuXReQ3ktMAq6tPDQ==
X-Received: by 2002:ab0:d8c:: with SMTP id i12mr2372886uak.57.1573662698326;
        Wed, 13 Nov 2019 08:31:38 -0800 (PST)
Received: from ubuntu1804-desktop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id j9sm541965vsm.31.2019.11.13.08.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 08:31:37 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:31:37 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: [RFC 0/2] docs: ftrace: Clarify the RAM impact of buffer_size_kb
Message-ID: <cover.1573661658.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improves the documentation of buffer_size_kb by clarifying how is
calculated the number of allocated pages for the ring buffer.

** Do not apply the second patch **. It's just for illustration
purposes.

Frank A. Cancio Bello (2):
  docs: ftrace: Clarify the RAM impact of buffer_size_kb
  ** do not apply this patch ** Just for illustration purposes

 Documentation/trace/ftrace.rst | 13 +++++++++++--
 kernel/trace/ring_buffer.c     |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.17.1

