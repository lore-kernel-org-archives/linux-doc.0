Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC5C17D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 May 2019 18:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731529AbfEWSow (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 May 2019 14:44:52 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34000 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731522AbfEWSow (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 May 2019 14:44:52 -0400
Received: by mail-ot1-f51.google.com with SMTP id l17so6413140otq.1
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2019 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=indeed.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yNILfyJChXA1qHX1Kqi1owLnUHep4ERKIkS79Wu1+tk=;
        b=ytyrCd/qOMiw0SMCH3uGeCH96UCKXfeNngBh+3fqTLyrvfr3w1CggUfgpYbxePvNdH
         mgBFPc9L9iqibPjumTk2GvTbWndammyucmWOw7SoENj+v2wcyYufN6wiTU612eG5yOFW
         L3WLFb7W/s9PKX9oom+IMNnX0YkzBTk+WZOnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yNILfyJChXA1qHX1Kqi1owLnUHep4ERKIkS79Wu1+tk=;
        b=MAtG5tfklbpgqARtE70wDsohM4HymGBOjX1yMZreVhmMW1264BBy2Mxj5iIpS6175H
         6bogcCS0XBH3S4Tz0jeHz007YBbX18YT/7hne4QIT2G5cQDcfNtXWY/RlAGQXKcl94El
         CvAvN7FUBkx7h/7b57vwOvB6H4WM4bZfWH3GUi69RfNiIYdPgUnDmvw2js2oWsg4E451
         gnR/xfNB+k+FAKU2aJAlqmIJPDtd2SlAhhtJMmiLujE+Opnp+1EAh7xnN+joRaxZPN24
         xN9ygSlUXVU6kUIVg5UvvIj3kcPZreVXRCXkdhv3k4K9g9fMNXoV0mDdlARjJB77qo0w
         tP7A==
X-Gm-Message-State: APjAAAUnR4HikihgVJIUF+DtRWV0RbewzlSAnFGZkZyfZ0OFeYEJpLe4
        pzRT2y3xMzx22FowfXRHwTPb2g==
X-Google-Smtp-Source: APXvYqzrg3W4K8wR2ebTIsIl4Uob3uxGrA1mPsTDJ1btsxIfLnHK4XWZ6ckIo/J0Nrexypt51+CS8w==
X-Received: by 2002:a9d:7a93:: with SMTP id l19mr3843085otn.49.1558637091094;
        Thu, 23 May 2019 11:44:51 -0700 (PDT)
Received: from cando.ausoff.indeed.net ([97.105.47.162])
        by smtp.gmail.com with ESMTPSA id s63sm83801oia.34.2019.05.23.11.44.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 11:44:50 -0700 (PDT)
From:   Dave Chiluk <chiluk+linux@indeed.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/1] sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
Date:   Thu, 23 May 2019 13:44:46 -0500
Message-Id: <1558637087-20283-1-git-send-email-chiluk+linux@indeed.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog v2
    - Fixed some checkpatch errors in the commit message.
