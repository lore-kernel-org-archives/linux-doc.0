Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F1341BE
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S86mj4zv"
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E09110;
	Thu, 12 Oct 2023 10:21:55 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-79fa2dbd793so50605839f.2;
        Thu, 12 Oct 2023 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131314; x=1697736114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=S86mj4zvTnA7aWvjCjC+NP6W0tzW99TEMCDcgBAUy0zZrFgZkOHOqKVgC5ehYiaHZj
         XDTY4D5R56lTmHfZ1gk6w/74lrmlR6Txvulqx2uxaDqCdZDMpjUny0zWP3ZchSLTsFBs
         aiHHlwOl6O/iRUQUt0rA9c9eXV3XoMFvXGq7GryC42/UvhrtNM+q6G3DRznDxvYqVR6O
         4IcOtvDnuxj9f8Q85Z3UepPucs6a8yJKQougESrxRzM5MifJ/d0oF6/+jsWh1zGAPuf6
         erAPy0LtfAnpxSn/TFvArdg3FHv5LKtGwspNtzgW5C6zyN4iWdNWRUDd/w9xcXvyHjyF
         Srvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131314; x=1697736114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=BWI33e+1Uv2QyiC9E6VK7NBD7PQi4vbeYkz4MZyvMIu4Qqtjsc8X5GfK91Q18BY/bF
         dMhOSHJzwbXeio65bG9He1NtjKLxB0DOShIxr20vqyxJopMQUariegJ+dYrOGz9UykVL
         JKClI0SZD6MKAGPYG07T+GX2R+tO9Wnrd9Hemuo5lr8NjDoI7QxXZpXmVDlOyhVPQKZa
         TWlE/3CrZub3WUmkaUwcHi9QODoG5Pj6yEX1jckXZRw8wqsmGuKNR8knQUpvOSgKQBiv
         6IFkN94t8QcwG3NkFTfx9sCjMXnI5rKvKn7MSXIHSD/7GdD9oZ+wIE8KOlZ0OGpDyu4W
         ayFw==
X-Gm-Message-State: AOJu0YyvOSm0nRaqwG2q2VQYsszc5PNaWCb1IVjQHYmXWsek0ybNMqhK
	6t4zUwfXjwClGCbC9VkHPHsxrJCWXzvgRw==
X-Google-Smtp-Source: AGHT+IEV/Vrzy7GYGKStkhfIcOPZVQougajUarL/RjBl0TBZoeQlTnUSIKMli3EDdf3vdTIkew3RSg==
X-Received: by 2002:a6b:6f05:0:b0:795:183b:1e3 with SMTP id k5-20020a6b6f05000000b00795183b01e3mr27077153ioc.6.1697131314198;
        Thu, 12 Oct 2023 10:21:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:21:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 07/25] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 12 Oct 2023 11:21:18 -0600
Message-ID: <20231012172137.3286566-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b53217e4b711..8116d0a0d33a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.41.0

