Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D76FC001DB
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 02:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjHHCnk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Aug 2023 22:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjHHCnj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Aug 2023 22:43:39 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABB819F
        for <linux-doc@vger.kernel.org>; Mon,  7 Aug 2023 19:43:39 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686be3cbea0so4105521b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Aug 2023 19:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691462618; x=1692067418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INNxwX5OXvLNLDOBW649YAXFL5xD3rewmot3fGeUu+U=;
        b=A2/H7xZD3CqmMHtFxsVqnriGlaXy35N8gBbwRol4vGFZvKVXNjRJ4I2Ej91W89NYJM
         wSNrqUuSu0NHolUuyrAQOlT9CF2bWUVb0RRUmRd1vsjGH8JXqQUMDtKUCngxFdnfJqFN
         O4M6br26j+O/QUpWu/rrKJIXEuTHwWBeF8GT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691462618; x=1692067418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INNxwX5OXvLNLDOBW649YAXFL5xD3rewmot3fGeUu+U=;
        b=QSp1bdDKs0W1fc/3TbneB7xd0puMe9lb0YIC6bOTUNr6FuM/AC3c+RAcU0ld6pnYap
         f5DREL4/gdylbc0lQIzUkb8+CVVMk+eP/BakqxBBwOxWHcKyCJT7osl54hxNT4GB+z9j
         ndjZAx1UEtZQQ+Y+q/Lna6pWHoAD4foW0zUXYPZ5MMulUSBcMkL9ufZeBYrDYZpjKKdA
         ZH+XS1bepg0lLfXkgoeBzYzNYEf31AxcRBB3SO/Vma4M9B2zmn9pArmlgmPr57y/uR8s
         2OjcweTqEehjXDDwAh8Gk/RmBKR+A4pcIxuKh+5cU+eSyD76Hh+1lk9ecuxKjjgakpN0
         4tmA==
X-Gm-Message-State: AOJu0Yz71ztGATBdzSlZ+4GZk3IfZ9tDdqtPcWOSQqlTkGT8R+bK+rTG
        3kBUvM1vCqRGMb/f32CMoD1FhJG2NczDXIUHt/8=
X-Google-Smtp-Source: AGHT+IEEHi3T6ZsjgaGRPluPDjQtcIdZ3It0oJBuq7pr5+R6rIUvnxra471DvdmsO6KuBdWwjldy+w==
X-Received: by 2002:a05:6a20:440a:b0:133:38cb:2b93 with SMTP id ce10-20020a056a20440a00b0013338cb2b93mr11291967pzb.9.1691462618594;
        Mon, 07 Aug 2023 19:43:38 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id p23-20020aa78617000000b00662610cf7a8sm7063479pfn.172.2023.08.07.19.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 19:43:38 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     jshargo@chromium.org
Cc:     airlied@gmail.com, corbet@lwn.net, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: 
Date:   Tue,  8 Aug 2023 02:42:33 +0000
Message-ID: <20230808024313.2220391-2-brpol@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Any progress on this?  Is it ok if yixie@chromium.org and I do the
followups on this patch so that we can also submit the Hotplug patch I
wrote (that's now archived?).


