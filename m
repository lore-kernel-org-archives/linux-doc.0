Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AF2C77B73
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 19:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjFDTGe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 15:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjFDTGd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 15:06:33 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F63FB3
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 12:06:32 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-655fce0f354so476779b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685905592; x=1688497592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbUejC7VSiKPBbjbIMnLeib6LPFan0YFbSc0p4xM48s=;
        b=rUJ60jE0CtomWv1zSSvtpeforOWFdIGr1yDVewqGoHno53FRmr3DpTihZdG5h1sU9l
         7Tv/Bu3kExfClR8JvZObbpvGE1ZnVsdnmEcIxO89DRuwwYK+bYIRvAHEMlzULYyalbPZ
         dDtKjaSQfdXzTNA235lAYkNIAohTdoOjId4S7ABUVPZ8e3Q/bXMqSVFi5mj3xq3mr0As
         pCvz0i24lDwh9x0+s+AcsjRw4FVT7JQ01UoISyEexf2GKVQDocn/MPJDgRuIFHIma7lj
         9rVW/r+RZ6Y3E2CKvw5l8E7ntCDFWHF7uSpJgB+N8kgOqGKjCvyfz1MlDak2FJMAIw3n
         v57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685905592; x=1688497592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbUejC7VSiKPBbjbIMnLeib6LPFan0YFbSc0p4xM48s=;
        b=AR7KdFERk6AUMgfcqR6HuPsG4RPDQ1JzFnP225bJnkoLv4ZNsFaqu/scpdp0lGnRAG
         93QqBM3G9hCNPwJtW1GN3i4U3yT9DAOkRyRsjA757J4mR74vJvcp19636Osw0H31yJ0E
         ZkIuhH5tIhfXr/A9vlSUH0tEc4JuX3rYsZcd7ghpKIUdzkomYhi2Tx+bA9pEVeEE1v+h
         7ZGtPknCQWt7QTl1pOJfV+YTIMZ2RJ0OkoTjsnlib7/xt8Zpm7xn3g/yNFt+0Nel6++i
         PZ0xGN7oBXeTNdQgfwpfL0VcrBTVnCzUThO/vikHwoXI7xweVFsoFNtWtuoIXME7nqnN
         6j8w==
X-Gm-Message-State: AC+VfDyNEh73YvcWKzM5FD5LEtQnrF3dZvhyOHJ1tQLZNJp+71I3oiBj
        z/v5nIkMmeN/jCj/4yQN23k=
X-Google-Smtp-Source: ACHHUZ54Dervt6Wvl7x+XZV5YlVrYo/Ef4fUT5zcf7MFzSkijq+30vW7FyPQvyJHFujKhbOAk/lkAg==
X-Received: by 2002:a05:6a20:8e19:b0:116:df6e:c84c with SMTP id y25-20020a056a208e1900b00116df6ec84cmr46292pzj.45.1685905591450;
        Sun, 04 Jun 2023 12:06:31 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001a6ed2d0ef8sm4979072plx.273.2023.06.04.12.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:06:30 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v3 0/4] Improve the dm-integrity documentation.
Date:   Sun,  4 Jun 2023 12:06:00 -0700
Message-Id: <20230604190604.4800-1-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Version 3, thanks Bagas for working with me.

Russell Harmon (4):
  Fix minor grammatical error in dm-integrity.rst.
  Documents the meaning of "buffer" in dm-integrity.
  Document dm-integrity default values.
  Document an example of how the tunables relate in dm-integrity.

 .../device-mapper/dm-integrity.rst            | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

-- 
2.34.1

