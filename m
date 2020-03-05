Return-Path: <SRS0=ObY3=4W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417BC3F2CE
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 00:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE492214D8
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 00:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583369891;
	bh=qBHd9zT00b7CN2peWKuf3SotoS9UgrnfGTi/urSOl9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=CSWK3G0UWgq11WKChALVR3Wc94CQYqcHkBCSHFrx7KaK9P4OA0HkBFN/CBxB7ydaW
	 4WXRoQ9M9xjy9+XaZ1EdJPifeHXKo9NhdevFvmBZ/R+Ae/WTOLYiwqVI+zhjU8pp0a
	 u3GCmK5mlheiy8s5X8nZWNfXngU2V1h9lAKN5oOM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgCEA6L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 19:58:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgCEA6L (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Mar 2020 19:58:11 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A2CB20842;
        Thu,  5 Mar 2020 00:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583369890;
        bh=qBHd9zT00b7CN2peWKuf3SotoS9UgrnfGTi/urSOl9I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Oe/JVIOOL2NJ+2yNnt2zTB42B65tVfqHBaSFXBE2M3ztqk22pAO1uLMOIh7CQ2MKR
         dKmTVQKvvKoTOE6lu2tS6Kp0N1c8DyjO90n7CJUfgf0/BNzRFeB8b1o9y6VfhFFSji
         tEgsdcmztSbJ8nCVhFu2O1UAyBmoswbKimT4md/w=
Date:   Thu, 5 Mar 2020 09:58:06 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [v4] Documentation: bootconfig: Update boot configuration
 documentation
Message-Id: <20200305095806.3ba477b939c07d5bec298b48@kernel.org>
In-Reply-To: <531371ef-354a-b0fa-f69f-c8cf9ecc9919@infradead.org>
References: <158322634266.31847.8245359938993378502.stgit@devnote2>
        <158322635301.31847.15011454479023637649.stgit@devnote2>
        <ad1e9855-4c64-53bd-7da5-f7cdafe78571@infradead.org>
        <20200304203722.8e8699c2a3e0a979aae091b1@kernel.org>
        <3a3a5f1a-3654-d96d-3b4a-dd649a366c65@web.de>
        <531371ef-354a-b0fa-f69f-c8cf9ecc9919@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 4 Mar 2020 08:20:35 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 3/4/20 6:45 AM, Markus Elfring wrote:
> >> What about the following?
> >>
> >> User can group identical parent keys together and use braces to list child keys
> 
>    The user
> (as Markus noted)

OK.

> 
> >> under them.
> > 
> > Another wording alternative:
> > 
> > The user can group settings together. Curly brackets enclose a configuration then
> > according to a parent context.
> 
> I slightly prefer Masami's text.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
