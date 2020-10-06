Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088DDC47423
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B86BB20782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993091;
	bh=2L6tpoHQxyeOwadIQQN4Im2A93Tx/4SXMLjoXbv8Smc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KldTy3+Yz453bqPAvAE9PlqvHGGafyvV/joMEQ46RaQAlTJA/hJ2tDxihtGnqkxYj
	 nuNq/fGmRyn7+0wXuQZBAqr+aqQ3L3MQDiEYZgh3NRspwMEKer9QpLOfCuwNb3DmM/
	 LFrpUOP9+TA6EpKy5wjyppa3a5ZtNkBZSfILoek4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgJFOD5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:03:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C678F222BB;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=2L6tpoHQxyeOwadIQQN4Im2A93Tx/4SXMLjoXbv8Smc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=exAEKYggUuFEkaFic/CHuC72Snm977+QxQ81M19/yvtblgtSbx0P0j6x6HhMdWKZv
         UXzcxT/LLU6/zsL8kjgF82Ccm7sOEhUT2WTamzxFqYjV+EJAfguD5Ta+hUoZ4eIGIT
         QEZ/mAc0ZBq/1RwfCFqP2CZHN3+ybapKMXgNlbgE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019GM-NS; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [PATCH v5 41/52] docs: kgdb.rst: fix :c:type: usages
Date:   Tue,  6 Oct 2020 16:03:38 +0200
Message-Id: <451ebc253e614fa8d1835980cec0e77b6a832d3b.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Which Sphinx 3, :c:type:  can't be used anymore for structs,
as this should be used only for typedefs.

Rely on automarkup.py for struct references.

This file has an special case, though: it uses the tag also
to point to an array. Let's use, instead, :c:expr: for such
purpose, as it should do the right thing.

This should fix this warning:

	./Documentation/dev-tools/kgdb.rst:875: WARNING: Unparseable C cross-reference: 'kdb_poll_funcs[]'
	Invalid C declaration: Expected end of definition. [error at 14]
	  kdb_poll_funcs[]
	  --------------^

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/dev-tools/kgdb.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index c908ef4d3f04..77b688e6a254 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -726,7 +726,7 @@ The kernel debugger is organized into a number of components:
    -  contains an arch-specific trap catcher which invokes
       kgdb_handle_exception() to start kgdb about doing its work
 
-   -  translation to and from gdb specific packet format to :c:type:`pt_regs`
+   -  translation to and from gdb specific packet format to struct pt_regs
 
    -  Registration and unregistration of architecture specific trap
       hooks
@@ -846,7 +846,7 @@ invokes a callback in the serial core which in turn uses the callback in
 the UART driver.
 
 When using kgdboc with a UART, the UART driver must implement two
-callbacks in the :c:type:`struct uart_ops <uart_ops>`.
+callbacks in the struct uart_ops.
 Example from ``drivers/8250.c``::
 
 
@@ -875,7 +875,7 @@ kernel when ``CONFIG_KDB_KEYBOARD=y`` is set in the kernel configuration.
 The core polled keyboard driver for PS/2 type keyboards is in
 ``drivers/char/kdb_keyboard.c``. This driver is hooked into the debug core
 when kgdboc populates the callback in the array called
-:c:type:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
+:c:expr:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
 function which polls hardware for single character input.
 
 kgdboc and kms
-- 
2.26.2

