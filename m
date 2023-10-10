Return-Path: <linux-doc+bounces-1-linux-doc=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBCCD8CB6
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 20:23:05 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CAA28129D
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 20:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B0431587;
	Tue, 10 Oct 2023 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WdSQ4LUy"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F431580;
	Tue, 10 Oct 2023 20:23:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8497094;
	Tue, 10 Oct 2023 13:23:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0223CC433C9;
	Tue, 10 Oct 2023 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696969380;
	bh=Ym/pxMbdvm247vTaNNOcOCuORilqXz04df7lVT2ORUM=;
	h=Date:From:To:Subject:From;
	b=WdSQ4LUy+sPEUUt1Kyz7iE86ijOhc3eQyXukBI12dF2xym/Fe9QCHZSFSaRiOfuI0
	 ciwvirbzHN6I44qJha9KH55vmB4UttjAyGtVEDp9mhD3YKYL/exL7EJ3ZMR7Xk8c4Z
	 YIqNHRj52/Iw2atIhSSoM7GnLNAFrzYBwZoJ1x5w=
Date: Tue, 10 Oct 2023 16:22:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: This list is being migrated to new infrastructure (no action
 required)
Message-ID: <20231010-triceps-flattery-228412@meerkat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list is being migrated to the new vger infrastructure. This should be a
fully transparent process and you don't need to change anything about how you
participate with the list or how you receive mail.

There will be a brief delay with archives on lore.kernel.org. I will follow up
once the archive migration has been completed.

Best regards,
Konstantin

