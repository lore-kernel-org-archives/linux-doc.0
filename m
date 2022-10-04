Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7023C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 20:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJDUMg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 16:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJDUMg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 16:12:36 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A85F222A9;
        Tue,  4 Oct 2022 13:12:34 -0700 (PDT)
Received: from meer.lwn.net (unknown [IPv6:2601:281:8300:73::5f6])
        by ms.lwn.net (Postfix) with ESMTPA id D7D3C385;
        Tue,  4 Oct 2022 20:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7D3C385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664914354; bh=m4M2Ub4uKFOA9of7HT4ZvmGu/HwFJamTrsz9zZ87vbU=;
        h=From:To:Cc:Subject:Date:From;
        b=kFlmfeYKOG2VMoHmaMGE4rqx0kI24GE3c+EPYIbmWKbMMZC6zyuOmsgk4BIplaX/o
         gmWYRIHcg7QwXjbcJbM41NfgQV8ZkPjx4ibaQdM0uXfNmbj5BR3vMOduW10n1NlxfW
         Zwykh690xXivuIBt0tYm8/7szCsQtUtxHQ1Z6w796guo4xnEZdfToUkDTLnK4f1Z9y
         2ASGCeEqfU7KPlNJPbu1WLm7TnHfuZRG2sodw3OBZk3hVPXm7p3bIfPSSUgpUxfShG
         dTvJGmzKf37JrbZVgddP04pIKtGUZ6FLL2plBffixwK+iar1sVWw3HXeCu5L0U85/8
         dyBDMb/Y80tYg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH RFC 0/5] docs: Improvements to our HTML output
Date:   Tue,  4 Oct 2022 14:12:17 -0600
Message-Id: <20221004201222.281845-1-corbet@lwn.net>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For a long time we have rejoiced that our HTML output from Sphinx is far
better than what we got from the old DocBook toolchain.  But it still
leaves a lot to be desired; the following is an attempt to improve the
situation somewhat.

Sphinx has a theming mechanism for HTML rendering.  Since the kernel's
adoption of Sphinx, we have been using the "Read The Docs" theme — a choice
made in a bit of a hurry to have *something* while figuring out the rest.
RTD is OK, but it is not hugely attractive, requires the installation of an
extra package, and does not observe all of the Sphinx configuration
parameters.  Among other things, that makes it hard to put reasonable
contents into the left column in the HTML output.

The Alabaster theme is the default for Sphinx installations, and is bundled
with Sphinx itself.  It has (IMO) nicer output and gives us the control
that we need.

So: switch to Alabaster.  Additional patches adjust the documentation and
remove the RTD references from scripts/sphinx-pre-install.

The final patch changes the way that kerneldoc declarations are rendered to
(IMO) improve readability.  That requires some changes to kernel-doc to
output a new container block and some CSS tweaks to improve things overall.

It should be noted that I have a long history of inflicting ugly web
designs on the net; this work is a start, but I think we could do far
better yet.  It would be great if somebody who actually enjoys working with
CSS and such would help to improve what we have.

As before, I've put a copy of the rendered docs at:

  https://static.lwn.net/kerneldoc/

To compare the kerneldoc changes specifically, pick a page that includes a
lot of definitions; for example:

  https://static.lwn.net/kerneldoc/driver-api/media/drivers/frontends.html
  vs.
  https://www.kernel.org/doc/html/latest/driver-api/media/drivers/frontends.html

Jonathan Corbet (5):
  docs: Switch the default HTML theme to alabaster
  docs: tweak some Alabaster style parameters
  docs: update sphinx.rst to reflect the default theme change
  docs: sphinx-pre-install: don't require the RTD theme
  docs: improve the HTML formatting of kerneldoc comments

 Documentation/conf.py                  | 27 ++++++++++++-
 Documentation/doc-guide/sphinx.rst     | 16 +++-----
 Documentation/sphinx-static/custom.css | 25 +++++++++++++
 Documentation/sphinx/requirements.txt  |  1 -
 scripts/kernel-doc                     | 52 ++++++++++++++++----------
 scripts/sphinx-pre-install             |  8 ----
 6 files changed, 87 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/sphinx-static/custom.css

-- 
2.37.2

