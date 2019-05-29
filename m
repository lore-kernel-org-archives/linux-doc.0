Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FE5A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 19:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfE2TIv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 15:08:51 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41646 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2TIv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 15:08:51 -0400
Received: by mail-oi1-f179.google.com with SMTP id y10so2980515oia.8
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=indeed.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9M83j5VgZqnbq4QKIC40z5RykjHLdbDcFYqEBFQAM9Q=;
        b=BgnltxIEsPclx/Vr/vTO+Gsl82dS1ePz6T2lP33ZTGsNESYjGtxIeObAnRKRmFAxOA
         Y74UbJTVWozTlkVex8yk1ziJ9mntkDto672j/G+Jtq1KcPlxdkM8kwH0tqXPesKj1dpF
         YxZobEBmWukUm2HLt5X+VxhllyQnhcBY9RLLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9M83j5VgZqnbq4QKIC40z5RykjHLdbDcFYqEBFQAM9Q=;
        b=tGdQtPko65eQ4XC7nYc267G/qDHs663nKZY6WBGtOzHtFOUBdaElDsJVTMIfQpUtHx
         g3DChpXnC7XREzdORNLvBKoCI2i1Gs+rDODhvDDGEjH2GaDy2r/P+PlSGgKw9egch4/t
         SSchydwabKb3xpB6+vbwFAGJcc22Su72sQwj99d/9JcHlic5f9JOeZvJGHUytQ1oybzS
         KoS806TiovjhdLhtSiquVupuVKHKfYsVqLclibGW1Quk5UwcG2xYxpaJhYeK6GoIOm9S
         r/MwBGZNp/mk5yYAaqyV/sQufFhrKumjq/FpP+hYzrQAJU77mPJ3eHne0/mDdBcLbAgg
         jmow==
X-Gm-Message-State: APjAAAXcTczDsmIsGTPSgiKWmzCx9U0hyxumWLCHiZNyctNDLc4wz0+m
        H1/0MD0EyXU+BMPxDCPB7DvAfA==
X-Google-Smtp-Source: APXvYqzK9c3JqRxvkrNr7vtfvTca6Y5lZHCWWdpg0BHow713tvjHfGSQqtezy7/bI8OVhP01rgLxXA==
X-Received: by 2002:aca:ea55:: with SMTP id i82mr7421001oih.33.1559156929781;
        Wed, 29 May 2019 12:08:49 -0700 (PDT)
Received: from cando.ausoff.indeed.net ([97.105.47.162])
        by smtp.gmail.com with ESMTPSA id w79sm136935oif.4.2019.05.29.12.08.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 12:08:48 -0700 (PDT)
From:   Dave Chiluk <chiluk+linux@indeed.com>
To:     Ben Segall <bsegall@google.com>, Phil Auld <pauld@redhat.com>,
        Peter Oskolkov <posk@posk.io>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/1] sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
Date:   Wed, 29 May 2019 14:08:45 -0500
Message-Id: <1559156926-31336-1-git-send-email-chiluk+linux@indeed.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog v3
	- Reworked documentation to better describe behavior of slice expiration
	  per feedback from Peter Oskolkov

Changelog v2
	- Fixed some checkpatch errors in the commit message.
