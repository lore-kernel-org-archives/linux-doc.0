Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DB86B7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 07:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbfH2Hqa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 03:46:30 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:41403 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfH2Hq2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 03:46:28 -0400
Received: by mail-pf1-f201.google.com with SMTP id 191so1851092pfz.8
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1wMjA5KSksLju2OI40VA1ZBlTUCnvvzsw6vzsXA8A9k=;
        b=tRP+YIfjsrAJxEUSVJpaCYb5qWQcnh7XHYJB/HsE8MfRkD1HhWBCqOjh1oLgQHnXfQ
         ey0UDHnkvETAbWD3LCQWBWCncLfEco0qlLBMe+MplhEyWNLAZz062F4YLh5GMfL51Lp1
         ULAGvPsIuBaEvvnCcIdgffyYjI1vPgjbSpGdD86MwCmpADhnqwz1vZom/N8ROuD1DXLC
         7QAzj0NFvRqHeHpuJoZwkWTESzRnpmkabkxS1E7W7+jxDLcxGbYh2ufppQTWstSrJPLp
         PQeicPm5eSszkSyeFuyjm4ry6ZLHknPP6Weqd3oR84pWtMAbS9VveRLLwIhn3yWXSVr7
         s3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1wMjA5KSksLju2OI40VA1ZBlTUCnvvzsw6vzsXA8A9k=;
        b=q3knP6sDexTNrYZZnxUFHTHATd9UScbGqChKbMn7xW40x6udGF/wDC+aDq6PSpwJXI
         t/PWKrlRlOCWRgWQMf4lhChqDodJCOanwtQHol0TTG/HtbSQRA7SC+oJ9KrEDWNHuFvu
         zR+ZKgob+QjFkaCUZZufXHaqEMsnOPfDGcmSV/Uf5iE8o++mTEiYaxvgbouaOK+UZB+G
         2exvFjfYq2sMCL/E/vUPiCniWfW1M+genUWtjO4D+1TGQ9/5IVjRMCYObXyglF4BLJ1c
         dDcxhBbHPymI4S+aW/uKtWXFEifOdG0/pwe5nbQhMrZruNJ6kWxroLggWn4JtrjXjuv8
         gGtQ==
X-Gm-Message-State: APjAAAVDXDKKsUiCNtUVchuxNR8Pr/kMqTtZxGyjCRvQFS52wTo4N53M
        /0zCrvgNERayvUh5vHUthI98EVJejjj+w88=
X-Google-Smtp-Source: APXvYqy0iijIpbH3w08NWcitjGLO96KFYxygObK3QlGE0ZWjdNzr6h5eig93o5niAFLwsu6AeKNhEV3SDXqNwuY=
X-Received: by 2002:a63:e948:: with SMTP id q8mr6861702pgj.93.1567064787979;
 Thu, 29 Aug 2019 00:46:27 -0700 (PDT)
Date:   Thu, 29 Aug 2019 00:46:02 -0700
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Message-Id: <20190829074603.70424-7-saravanak@google.com>
Mime-Version: 1.0
References: <20190829074603.70424-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v10 6/7] dt-bindings: Add depends-on property to break cyclic
 inferred dependencies
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com,
        David Collins <collinsd@codeaurora.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The functional dependencies of a device can be inferred by looking at
the common devicetree bindings like clocks, interconnects and
regulators.

However, this can sometimes result in cyclic dependencies where one of
the inferred dependencies isn't really a functional dependency.

Add a depends-on property that can override inferred dependencies by
explicitly listing the suppliers of a device and thereby allow breaking
any cyclic inferred depenencies.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../devicetree/bindings/depends-on.txt        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/depends-on.txt

diff --git a/Documentation/devicetree/bindings/depends-on.txt b/Documentation/devicetree/bindings/depends-on.txt
new file mode 100644
index 000000000000..e6535917b189
--- /dev/null
+++ b/Documentation/devicetree/bindings/depends-on.txt
@@ -0,0 +1,46 @@
+Explicit listing of dependencies
+================================
+
+Apart from parent-child relationships, devices (consumers) often have
+functional dependencies on other devices (suppliers). Examples of common
+suppliers are clocks, interconnects and regulators.
+
+The consumer-supplier dependencies of most devices can be inferred by
+simply looking at the devicetree bindings of common suppliers like clocks,
+interconnects and regulators.  However, this can sometimes result in cyclic
+dependencies where one of the inferred dependencies isn't really a
+functional dependency.
+
+When there is an inferred cyclic dependency between devices, we need a way
+to explicitly list the suppliers of one or more devices in the cycle so
+that we can break the cycle.
+
+The depends-on property fills this need. It can be used to explicitly list
+the suppliers of a device and override any inferred dependencies of that
+device.
+
+This property shall be used ONLY to break cyclic dependencies.
+
+Optional properties:
+- depends-on:	A list of phandles to suppliers of the device.
+
+Examples:
+Here, the inferred depencency would state that cc2 is dependent on cc1 and
+cc3; and cc3 is dependent on cc1 and cc2. This creates a cycle between cc2
+and cc3.
+
+With the use of depends-on, cc2 is only dependent on cc1; and cc3 is still
+dependent on cc1 and cc2. This breaks the cycle between cc2 and cc3.
+
+cc2: cc2@40031000 {
+	      compatible = "cc2";
+	      reg = <0x40031000 0x1000>;
+	      clocks = <&cc1 10>, <&cc3 7>;
+	      depends-on = <&cc1>;
+};
+
+cc3: cc3@40034000 {
+	      compatible = "cc3";
+	      reg = <0x40031000 0x1000>;
+	      clocks = <&cc1 10>, <&cc2 7>;
+};
-- 
2.23.0.187.g17f5b7556c-goog

