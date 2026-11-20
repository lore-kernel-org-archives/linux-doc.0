Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189191;
	b=BIu+JiLBo7jQ0afDFdC++kDCK0OUPsUdvS2NkfuTozD8Fz+bhdMYdq9oMwACi/HctxTj
	 k2u/WGSrRhq2H6lBrOwZfBri7ROfjPxCGEUnHRn/s6/xIcXtuIuRiSuafgFyGJ5IoMckO
	 zT0tLitx51038zZoYAsY76xPCpfSeULnudmnMB35PJHF8LtKAbb0VWcFoNffGAvjM2Uvc
	 V1TpbL5y1+01WUCwK0S5TrzYlfgUVE1flHzOiA73aasHll9f8ozHNFmimQUeRNVnA3cps
	 qbna6M8Mf1gzAmHRCqs5gtbPHzZLXsN2VkwTi8wsVj+Ox9F87Wm0gTyVLrMlECYPcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jn+/Prnek8JqUOnxYbtVgNU+Atd7uT15342oBo1hEcs=;
	b=OVkyrysdW0F2fb/w59iHvfx0vNs22u8+A6u6UDSS56Xy60gz/C3ztzZR1evYifMHuT8A
	 BY4N9oWGp4iIOvMOQ+rbiOqbOkddTyEVXCdpShda5Zj7xT1I4SnFQ6MbojDhE6TwEjnQY
	 fItws29GHcHUmlFlzdMvEee7hb2nTvb5CnAWUxPmknvdeV0Rd02Hzo4txFf0P9k8D1yaI
	 HkPl+cZNy54cGAdFtsWn2xhdbd+h0rHwbI8nHOfYpRVMy7EmtiPy5/3wwScT0V7u5fntc
	 P7omoJ/A4zZBFtYPk7IqFjIlVaocravnn8HxTtJ75p3eGYFhWdwoWUcV7wB0y0O1o0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bx687rB1;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8435606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 15:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8435606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bx687rB1
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-716d85c01f6so339017eaf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795189190; x=1795793990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn+/Prnek8JqUOnxYbtVgNU+Atd7uT15342oBo1hEcs=;
        b=Bx687rB12yGEl1N7bKZ0d2BpxUpChnr56saZNNmjNyJ6Yhb2Ff3oHO4n1ObwWJwRJo
         0pwsXCN8T0gNuVHW1v8LzGehH0brcqX1h8x/cUbE5/zxq1eA+/Vd/jllr+90jk2ZDYOU
         6tl5q+rvrc6sI62Ho4xRBNpPoQLgdDBSJDdqV88+FrupfpttK0jNBWY+eafEIHtbAihr
         GtRvZ26mJxnSsoLcxfp9XyausfXJF9U3gYjWu8A2axIUjwS97bBQaOkeHNx6YtptEki6
         0uEa5KWJLrOUcRgCL5cA2d+D1xHBp2EP0lJF69eXy/dXAGWcaYRmk2HavCf6OV1xYGAL
         0rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189190; x=1795793990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn+/Prnek8JqUOnxYbtVgNU+Atd7uT15342oBo1hEcs=;
        b=bLBH2bR3XnJSM4kqntinAF23KbGZ4D9SLfx9oStV2FdPNsFFEvbTA6s39FLkGvrtwe
         PYjD2X/PRc4U+WByeqU4jMYGs/sa+KBiVF9K6zqANlC6sLCd7s4OJACHJvUXsIq/+vYr
         yYXI4ejMLigPq3NwnuwlkSoo1f+uo1azsr+miGJzOqeCjEFKVT0IGMUdsE+RKnW1LAln
         Ymf9imG4myy3KujYjSdx4scTiB8ufYzGqp5iFVh5/VaCBfPM0C6dGoOQV6yjWs8KiGKc
         zQBKKBpjDbUG99dLpg6t7PekUYE7kO4WQiLLMKsSU/D/giFzpyLEAKwRqN9mZ0SEQTsK
         V59g==
X-Forwarded-Encrypted: i=1; AL+hErE1MmblUgkIVh6/Z0HH+FOaDR99DCENyfKM8lJJgo/KqZpJNgNu1exxdZMICIK5h6paEpKlsbAJ0Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z81uBAgaeY8O4xTyC9K+OUfqDPQugQqgcR53KISo7BKbCr28Ira
	DNfe5HGxbe7AFYm6fys3q5XUanb/re+552w5U8s89mQWs+TlZh4IeAKD
X-Gm-Gg: AYBFou1RiFMgmC9cjIr7YdwhNbAmjMZS0cO/x2JMan/miUBdkBQKud1i/wRRTaQneb7
	68HUNPAd1BzIG5ezzAIz6Hli/h2mwTZk88vuoTBdEaRm/udME9hIseWoFHqE4H+oqfnKAidBXpj
	7vpktEb5GgvDYXW8hlDb51MtbDwqMZMLiLcyytMjQi7/M56MTcHqsSNrh/RcMfMipdVwfg1cpf4
	o3JKKfd2szstNCP0HYFJCUh8REBmDTdvY7h52viEi3APTbngBUVMynemmR6AmjWZvLClbBCooQ+
	skIVIFry8Vz87X2a0RzpR72KA1UNlSevybhAu+XAh6SZqLV+jx04qSqx94CUAfUyFuobaVMVfDy
	OBkOeXPZPs2EV75nh5U9JuH9M5zJTUI9fKyY9grxDc8jHAzIZUfLOUJBMZNJ4FPSl45Y7k5iBXo
	n70Vhodi+TjKmETsEInK6Uh21kRAoZMickuQfn2DfDqayvecypIxCNAzJHFu0xrwgclsf2zNVvh
	WkK8X2WevDN1ZTML8PCUYIki8a5rQg2GVfVq0By2q6eqOm3eSh5lqKRUyivdnz7WopGTv/6f6wn
	oMNVDj4AJj6FVc5gxJc30bZ5x3W0w/PhLj8ks41dxnjhO6Hmpx6kD2ac6uvmFYKdNJiLLbTEY8q
	jJAOUcMxbNAjElQ+uO7EMqJWGqS7rpjzgrI7ifA==
X-Received: by 2002:a05:6820:c5d1:20b0:71b:c46:3ac9 with SMTP id 006d021491bc7-71b39401a4emr1770546eaf.25.1795189189676;
        Fri, 20 Nov 2026 07:39:49 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38058102sm1950557eaf.6.2026.11.20.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:39:49 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	josef@toxicpanda.com,
	bvanassche@acm.org,
	cuitao@kylinos.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v3] blk-ioprio: check capabilities before promoting a cgroup to RT
Date: Fri, 20 Nov 2026 15:39:39 +0000
Message-ID: <20261120153939.81178-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ioprio_set() and the per-request I/O priority of aio and io_uring only
hand out IOPRIO_CLASS_RT to tasks that have CAP_SYS_ADMIN or
CAP_SYS_NICE. The io.prio.class cgroup attribute has no such check.
Writing "promote-to-rt", or its alias "none-to-rt", to it changes the
requests of the cgroup to the RT class.

The attribute exists in every cgroup that has the io controller enabled
and it is not hierarchical. A user that got a cgroup delegated owns the
files of the child cgroups it creates there, so it can create a child
cgroup, move into it and write "promote-to-rt" to its io.prio.class.
Its requests are then issued with IOPRIO_CLASS_RT although ioprio_set()
fails with -EPERM for the same task, and mq-deadline dispatches them
before the best-effort requests of everybody else.

The delegation model in Documentation/admin-guide/cgroup-v2.rst expects
the settings of all resource controllers to be hierarchical, so that a
delegatee can only distribute further what it received from its parent.
This attribute lets it raise the priority class of its own requests
instead.

Require CAP_SYS_ADMIN or CAP_SYS_NICE for the two policies that raise
the priority class, like ioprio_check_cap() does. Check the credentials
of the task that opened the file, like cgroup_release_agent_write()
does, so that the check cannot be bypassed by passing the file
descriptor to a privileged program. The other policies are left alone.

Fixes: 556910e39249 ("block: Introduce the ioprio rq-qos policy")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
Changes in v3:
- Include <linux/user_namespace.h> instead of <linux/cred.h> for
  init_user_ns (Bart).
- Add the Reviewed-by tag from Bart.

Changes in v2:
- Check the credentials of the task that opened the file with
  file_ns_capable() instead of the credentials of the writer (Bart).
- Document the requirement in cgroup-v2.rst (Bart).

v2: https://lore.kernel.org/all/20261117111157.2968-1-dennylin0707@gmail.com/
v1: https://lore.kernel.org/all/20261116090529.69650-1-dennylin0707@gmail.com/

 Documentation/admin-guide/cgroup-v2.rst | 3 +++
 block/blk-ioprio.c                      | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 9e3c67b02ae2..4424f9cf583e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2409,6 +2409,9 @@ that attribute:
   none-to-rt
 	Deprecated. Just an alias for promote-to-rt.
 
+Selecting promote-to-rt or none-to-rt requires CAP_SYS_ADMIN or CAP_SYS_NICE
+in the initial user namespace.
+
 The following numerical values are associated with the I/O priority policies:
 
 +----------------+---+
diff --git a/block/blk-ioprio.c b/block/blk-ioprio.c
index 8fa8bca35062..7fabac24dbfa 100644
--- a/block/blk-ioprio.c
+++ b/block/blk-ioprio.c
@@ -14,8 +14,10 @@
 
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
+#include <linux/capability.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/user_namespace.h>
 #include "blk-cgroup.h"
 #include "blk-ioprio.h"
 #include "blk-rq-qos.h"
@@ -91,6 +93,10 @@ static ssize_t ioprio_set_prio_policy(struct kernfs_open_file *of, char *buf,
 	ret = sysfs_match_string(policy_name, buf);
 	if (ret < 0)
 		return ret;
+	if ((ret == POLICY_PROMOTE_TO_RT || ret == POLICY_NONE_TO_RT) &&
+	    !file_ns_capable(of->file, &init_user_ns, CAP_SYS_ADMIN) &&
+	    !file_ns_capable(of->file, &init_user_ns, CAP_SYS_NICE))
+		return -EPERM;
 	blkcg->prio_policy = ret;
 	return nbytes;
 }
-- 
2.43.0

