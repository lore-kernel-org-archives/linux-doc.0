Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B50F7D910
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Oct 2019 17:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbfJaR6h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Oct 2019 13:58:37 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:36662 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJaR6h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Oct 2019 13:58:37 -0400
Received: by mail-pl1-f181.google.com with SMTP id g9so3025557plp.3
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2019 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6p3ywuf53bWKWHHevh50Ml2LimZ6glMYZNKbDrC4v98=;
        b=xGa98NdAYxbOq1ug4ttwQ2UNql6OhxIR673aHidRoHDIIHWQUwTcZWgj8+jGeyqIFQ
         bECFpsqNA+CGCGX2wxZyBdnY50QYUx6yXDdGgDTtsiStsWvVDKBlXAQobcx5xzWG6f+g
         aOfoF0AP2iYNgFTdE8EmhYJgPh6Jcv17O4mPGJPFE1T8QayL2Cz1xcYUfSiEvSvPRHvR
         QEJIpCrgCK3MaNTxVM5tzYFCTfoz+Q6jtfu4ZudDDOEdbDBMU/u2tyutv3Y8s7xAOe9s
         XIDXRKukLWJTN58uEMmnUtuwddeUQN0EtgY+xQds0/HMia7JsUqUY8YPBmVzWEne527d
         LKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6p3ywuf53bWKWHHevh50Ml2LimZ6glMYZNKbDrC4v98=;
        b=oZktiRRDv9sEACgQJ6U+tj+KjWQ9WjRHzJVI2L/G4FFShWPlGlWsrZnYwgzgpl2rFZ
         Al7Ct/4gJB3BATKC6UhO+qiwhTxRi08kx3WtP840Egq/H+0IvvlOACeGezoj/SxuxmBE
         MrXuRa/ht66zoeC7ay3Ofwm2IwoIzMnNbfXKIi9djIPUuNm/CnfrkByHgBYc0Yj8UoLW
         U85kD5grujGVK/7pVMskjyDdythJEFQroRxfOMeD5UbaxLULsbS9Q9KitcD4juRJroWd
         zOBfL7uWsBJWldtVY220QZ2JFLLCVsmEmx7RriVCS0zIyo8wGJyfQRTsNlr8foiqIP6c
         xoxA==
X-Gm-Message-State: APjAAAXtG121Yx1sE+56Z2hks3cF22VsFYVDHvZ2bnol82P3DKq65xYb
        FANfo0T6aM/ZPmrFNAIwK8NqSV67ZJY=
X-Google-Smtp-Source: APXvYqwFB7XQpl+UDQ+wRv3z6CI9YpJNwLDniZXRi7Ul1eD7/eRyBjKjIopFI2DToJqBeWyilRkgpw==
X-Received: by 2002:a17:902:9691:: with SMTP id n17mr2163167plp.12.1572544715475;
        Thu, 31 Oct 2019 10:58:35 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c6sm4382210pfj.59.2019.10.31.10.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 10:58:35 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     corbet@lwn.net
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 0/4] coresight: Documentation: next v5.4-rc5 
Date:   Thu, 31 Oct 2019 11:58:30 -0600
Message-Id: <20191031175834.17548-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Good day Jonathan,

Please consider the following patches for inclusion in the next merge window.

Thanks,
Mathieu

Mike Leach (4):
  coresight: etm4x: docs: Update ABI doc for new sysfs name scheme.
  coresight: etm4x: docs: Update ABI doc for new sysfs etm4 attributes
  coresight: docs: Create common sub-directory for coresight trace.
  coresight: etm4x: docs: Adds detailed document for programming etm4x.

 .../testing/sysfs-bus-coresight-devices-etm4x | 183 ++--
 .../{ => coresight}/coresight-cpu-debug.rst   |   0
 .../coresight/coresight-etm4x-reference.rst   | 798 ++++++++++++++++++
 .../trace/{ => coresight}/coresight.rst       |   2 +-
 Documentation/trace/coresight/index.rst       |   9 +
 Documentation/trace/index.rst                 |   3 +-
 MAINTAINERS                                   |   3 +-
 7 files changed, 925 insertions(+), 73 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
 create mode 100644 Documentation/trace/coresight/coresight-etm4x-reference.rst
 rename Documentation/trace/{ => coresight}/coresight.rst (99%)
 create mode 100644 Documentation/trace/coresight/index.rst

-- 
2.17.1

