Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC7E4D09F8
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829129; cv=none; b=a19oQ/yU5wooqE5c/qdl7t3tF/ZwB1RF2kSeJWVdGkpMoIdFgj0WNTFZ7j64BPoQvDvmvKsQimLXMwomkJa03rx4nLzJODUfGDM90XLEEoOZyz7I4lNXey1UP9wNIKQLhBgITXn2XUVBNp/axzkcuCrO5eFOa8mtcpA6xjXLOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829129; c=relaxed/simple;
	bh=biCTKkk9cWwd98gBnjAIhfURZEagU2QQtk7DUdBFB1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIaJzpRge5F2F+HKI2Bao4kS+B36NscIxioq3DMc3KfadeoOiQ3bDc5vjjT/InmYxWz/x6JccTfGfDmHvAAbErkYqfa81N2FD5GY2tDoiLzMcg/0GfyU5ZCTtx/Q1CWJMdwNdAwFy6EcfrIvS6XxKfWKFgraXK36fVWHyYnAF/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EStGBjCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdOeUcWV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EStGBjCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdOeUcWV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHuihh3040338
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=; b=EStGBjCodd9FAh4m
	bPsTOibAtmpubqjgoz0cfp5wjfMBuzOGviTM+Rmebo+ODGP7bS7cQqYwyJpX2sLd
	/4bNHmmFB+tlnh87XwuDfjS7t6N9h71ePUsCjqXxrXOfZvoMGTYCtWEd/0VkqpE+
	UJqMYBBvB3yt7Hq5MooLEuqTENBW0MrUob0uvf8lnS2Eid0gbYtonkanr6rJCoBp
	nwDRe2R+4nIwqUO6jb/8Wc5KYZOaUBN32U5JWWQMM0n76WLp6HutqXqsgVtRSmvX
	dFoh24twaI9gYzoAJ106nESWQZmVfDzncpbjCD7cbsRQOmEe6Sx4utpW7A9bPQMa
	Ygk02w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjrq24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:18:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3592749a017so1800758eec.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829126; x=1792433926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=;
        b=OdOeUcWVlpvGglrMuZo1A0m8iMrTz0y14+K6LAh/ywTV2KrTmGXFQB0hMDx4e15RPp
         /ZBcMS+WOOGpp0WAsIZOd/pCNW9SDXZGc7aIDTnjz/jaDg+BV9Tewvt2VhJNW7SssMU4
         LcmoKnSqE/PMunvvjHC8GFSIOafc2DPbizYPLKwrt41L9+Sv3ixllQxIvJRH51EfgJxm
         5+fLJVNYCgLm02UewR6+WZcJAD9MfwakTJmmJ/PUbGaWiiJJYk/Qgvz2tWLTpbUEnrtp
         +2a55CjuE9wxcdYDGv1vxEcay366sQY2y6xeaaSlsm0G2wS+VM1BWbq6KQ8r7IBPvXl0
         p8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829126; x=1792433926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=;
        b=kC+WTp2cyVISwijjcGcteGX/bbMdupQjncWPwl+HVn1NVTVmG5q7gUgaoUD6xiR4qt
         fiSAb0bJELE5V3kykNh5QpKb4QOxnKFXAku9sJpZBBldqRp2HPCfvXNfGDqhVZgijnp+
         itKIq4Dk6lm0LfIZnR49DOm9YHXwkEV68psOOfpRa7/+kYiU+ZRcGm7zWsMg1wLj12QH
         gXda5V8eU+hMiyvM8c8llrJOCfAYCe7Oy1y4jPFuaMCb1V0icwJYF9LyPQruGKHNeNva
         y3LMNgdu/yWtZk29k4/+lOLtpqGh552ByGyceVMrzkZGx9tXo9vwPNGYYiuLe3RM2sNS
         eEgw==
X-Gm-Message-State: AFq9FYJwR0lGt3xpuauMQbRSfoRB9Mwr6z0GoDtba3QTs9yhaiOg/roV
	WD3Xorw7bcmX/ePWclMzZH5aUVHdrwy5IhJhe3aHBZqsNomg3wc6/pFfn0gngbMtpDJlWT0g4HE
	YRZudEgamXDP0Rgh7tmFykc/bTLZmJqS33cNc71kCOJ1D4kF/gM4c7unpH1WPn7U=
X-Gm-Gg: AYBFou21dhYMDKydyi1ceH7wGZGnktBcvGbmdSwS/zBAw8YCbJgwaDAYH5q4O0ZjNg+
	6DqFT6TSoD1WLq2IHTparkYrhFPnYZTwWLDFmf/tbYMvNY2nsCqdANrNvZa0CqBL5/qeDBLeJ93
	YwJDpuz8bl0MTQUkBJrWKnzq7HHIT/0ZmynVLXM2f0Ay8Adw0dkOXSgIaSHWdFJ4EegyTQiZxaP
	13kFDRGbjaAGeLT4TOAHY1O+SR8mGwusyLKQYlDZReSMJ94Cjq7OsI+wsladt+phR+g0GVTBG9R
	qHAewjX127JM0T7fonlvUbgx/+dR9Yz74p7yA4EtGnWqujzlJdX60yqpbfPtZ8XkurzPnanABPl
	vyfDeNkmzHHj9WPTQNxksA2Ee57ih
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr20292634eec.23.1791829125498;
        Mon, 12 Oct 2026 11:18:45 -0700 (PDT)
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr20292580eec.23.1791829124783;
        Mon, 12 Oct 2026 11:18:44 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:44 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:05 +0530
Subject: [PATCH v8 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-7-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=5269;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=biCTKkk9cWwd98gBnjAIhfURZEagU2QQtk7DUdBFB1g=;
 b=rNpcIcoT6p3dUnSxv/tKEOCWAlWVtheh7cYYCU9K6GOgg6t4DyK90xgIrBJrCYfXNMOEguhvw
 v7VzamcyOC8DU1fJQMMd3Gu4CvV3DyLKOcnfVQ+lfHBL6pJl8tuhOL0
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: vFfsSwtmp3dG-Uta6qETAL8LXx7zcyTg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX+AIaJTcxiUNn
 LBfjV7u/m6sV9vyGZ7p7O+vrpX7Py2EsVskJEk5/1eL1A5lJ4cR8nGsTS6OoDSxBo8t3CH3ILog
 LQiH7sUYZHyRwgSSF0zbsDWS54uSRA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX41LMoOtAaZ4t
 sMv3pLDB8qrJPliL/uLh8c+a2Lee89soUyu6epP9SSjxQ11DX3rN7LjFkrhQjjd0wF5e23B5lDd
 RMJDqdHp5iXr3uJoZaOyh4Pu2a8/tK7jROQEQjlNGFbSStiO9jzjRSldwTbK5WiJDsV8fD9rnjl
 esZN4WhEvG26XXZ5+wLs/Ibc7MkXoOB/6bl+fviHa6sq0kN+z4k6gaBk+NGP4XrFjHMwnkXFa/Z
 4dgMADSp+G36IZX+erMQkfSrlAs9hYGiRp6Kok8vQryntGO/9EgT2TmH0qMxjQ/rB+Dd/0JilZ8
 ODDGDhrY48tJzW1DPq15Nt/HQTN88xp7n0aTzv/a3kw3Rt8Yct/xXIlb7yrRzOjb9vhQ+RxLacj
 Y2jXJbndgDDI1vMMWViBU0JeGYFVRwq4VUmT8cxHtxMkt0AIRQ8l8KoKnjPe6JovQzqKR0M6m79
 yhkQGqHul3NGrldCm7A==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd2486 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NePjL4a1hEawMabAjiMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: vFfsSwtmp3dG-Uta6qETAL8LXx7zcyTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 63 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index e7a6289b11a72d5dda008d6107eff6b4f9b67519..db6fb966fd93c9fef82e5599b7133299e1a4c337 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,67 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No complete data yet or offset past end */
+	if (!ct->data || ct->receiving || ct->copied != ct->size ||
+	    offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+static BIN_ATTR_RO(ddr_training_data, 0);
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1130,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

