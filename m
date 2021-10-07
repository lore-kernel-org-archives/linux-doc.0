Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DA9C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 13:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA982603E9
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 13:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241890AbhJGNz3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241882AbhJGNz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 09:55:27 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E7BC061746
        for <linux-doc@vger.kernel.org>; Thu,  7 Oct 2021 06:53:33 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id e16so6185153qts.4
        for <linux-doc@vger.kernel.org>; Thu, 07 Oct 2021 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4D+8fIGQfZQRL6O4ilxte9acbk0yTFGz3kGbSFrFrjQ=;
        b=S4TlnmGf7fi2da0VpIauoGdtpAJV+eZPvZcJOHWpH+jfyiZLWL2u6prLmVlXzTNHTS
         3NWVgVksHlLSni+Zh0aCeVJOcRAnwic8Wj34OMyRQlGjq6bM/jPybQuzRrsgOkVGzayG
         XqrRZYYyKo1yWqnLu7VhI8h9lK1JpBXbA5hWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4D+8fIGQfZQRL6O4ilxte9acbk0yTFGz3kGbSFrFrjQ=;
        b=ZeFJbY61VFFmNc64ty6kaOvGUlBi+BgpRa4aps61fICdK7SaJd7oLoEv66XPpwQvvV
         tivJAZhhbQzMiq6GeGonrn7Ph99vIAxSI7DFehTikNRZhnSiLyeIxTlg7lVCBx05dDOe
         YIUrWJwGHQuJxSWaPD8PuaFrVjH5JDK/MiCe3CcQsvO1apSlJ3x2dxDkhVSwNhAp+OHn
         ia2phXRBVmk350PXbgsR5pUOXJ4yD40MthV38RjiCp83A7GWSIMWUZfEU6BC9M8Lwuv1
         IM9gT21CDEeKX7TWOvCVIsCO55E0TD6iXq2GjHcxbeSYvgSqydv3RTtARxgpvrvlFvm/
         t5Sw==
X-Gm-Message-State: AOAM530Fn5UUvvho9S9ss6bh3e4QD9lQ20QiL3qcxJ0bqqaZfYAsogM0
        r6q7MVq1SR9E0ihfV0fkjqkekw==
X-Google-Smtp-Source: ABdhPJwcHrr57LfvIwqtKNYhUgrL8xhLV52BLnYDjYiyfPL9kN5rmd66eD+Gnx3mCFC6OBQwVa0b5g==
X-Received: by 2002:ac8:24e:: with SMTP id o14mr4893747qtg.183.1633614812739;
        Thu, 07 Oct 2021 06:53:32 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s203sm140319qke.21.2021.10.07.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:53:32 -0700 (PDT)
Date:   Thu, 7 Oct 2021 09:53:31 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Prefer lore.kernel.org and explain Link: tags
 better
Message-ID: <20211007135331.3gi33cltdybljq54@meerkat.local>
References: <cover.1633593385.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1633593385.git.linux@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 07, 2021 at 10:04:59AM +0200, Thorsten Leemhuis wrote:
> v2:
> - slightly reword after suggestiones from Konstantin (thx!)
> - make this a patch series with an preparatory patch that does
>   s!lkml.kernel.org!lore.kernel.org! everywhere in the docs

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Thanks,
-K
