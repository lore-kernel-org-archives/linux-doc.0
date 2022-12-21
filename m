Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581ABC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 21 Dec 2022 20:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiLUUJi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Dec 2022 15:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiLUUJh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 15:09:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F20B23329;
        Wed, 21 Dec 2022 12:09:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA9EF6190C;
        Wed, 21 Dec 2022 20:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF4AC433EF;
        Wed, 21 Dec 2022 20:09:34 +0000 (UTC)
Date:   Wed, 21 Dec 2022 15:09:32 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Rudo <prudo@redhat.com>,
        Ross Zwisler <zwisler@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        kexec@lists.infradead.org,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/3] kexec: Add new parameter to limit the access to
 kexec
Message-ID: <20221221150932.02cecdd3@gandalf.local.home>
In-Reply-To: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
References: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 21 Dec 2022 20:45:56 +0100
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Add two parameter to specify how many times a kexec kernel can be loaded.
> 
> These parameter allow hardening the system.
> 
> While we are at it, fix a documentation issue and refactor some code.
> 
> To: Jonathan Corbet <corbet@lwn.net>
> To: Eric Biederman <ebiederm@xmission.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kexec@lists.infradead.org
> Cc: Joel Fernandes (Google) <joel@joelfernandes.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ross Zwisler <zwisler@kernel.org>
> To: Philipp Rudo <prudo@redhat.com>
> To: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
