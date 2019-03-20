Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 634387D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 18:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfCTSbO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 14:31:14 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:48030 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfCTSbN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 14:31:13 -0400
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net [73.223.200.170])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 1C3254B4D;
        Wed, 20 Mar 2019 18:31:12 +0000 (UTC)
Date:   Wed, 20 Mar 2019 11:31:11 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc:     linux-kernel@vger.kernel.org, qais.yousef@arm.com,
        dietmar.eggemann@arm.com, linux@manojrajarao.com, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        gregkh@linuxfoundation.org, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        mhiramat@kernel.org, rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>, yhs@fb.com
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
Message-Id: <20190320113111.d68a7c71c2c163bbc7d5f6aa@linux-foundation.org>
In-Reply-To: <20190320163116.39275-1-joel@joelfernandes.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Mar 2019 12:31:14 -0400 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:

> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.tar.xz file).

Lazyass here hasn't been following the recent review discussion and is
going to try cheating.  Are there significant outstanding concerns now,
or are we good to go?

