Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467352;
	b=OC2xTeyGKQgH98W15d1TFJTOjzpk1QmAdRznDWsPFVIac3HEmuUGhCBZXa1wKpdS/0vU
	 nZLzgopFblK7xj3yvjYa/PnULHSlKuAo3gtDeoCZPq5bRLIp1d5FV6WVRmHPFb6jkLPJu
	 VrNFD7E3ElrO1J/pwZ9pbY8nM3PtqXEGHOSQ39XH0a9gxVpaAJfDBMUFUAt/+tzbaowg2
	 82dm3mBnO3+onc92/duFzk0AuIhnvGxi6vwNOUUQlrtREMgo3YUglAF7+rXXIR/FnlikR
	 kwo6WuImrT8JRASO7M6nTzRH8PTxpdF15jwLCyYdzoGV63DFQ1exy5684D3SU3wVxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
	b=a+KXZxfKvNLzQw58xVt+FmeWmF0gDAj0pCvanns/8YkaUEXJ0M92lTSUoPf3cHfizdR1
	 5xobg5OSNZJTqcfLpON5iMCpE339ImbVr+g++dS62G7E8uWlVt6Dg8GaSng3pGyRXvUka
	 ui1Oz7sD6jgXkEHHSyD/cMJ9/obkd3ANw5qWCMlflLrGi1p2zzQaEmxwuzlkE4LnW06uN
	 JsfV9RgZA4qnioqkrllCPYfpQhQLot39z14MveSl3Jhb6ujbT2F2GmOi399B5FM+wHja9
	 0wvakPmjnZQr2TZWRxmB7RQgtmqmfwi9eH/EB8Bw4TBeGTFKzN722g7DVCAEwxb4a1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB11E606A326
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB11E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuufG026550
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=; b=APu6pruJKuRJdjIk
	YeJmkmvT43n9u64h/gmBKxcfibSMm4ZFWJ8ET9J3EmS1HcIHgEL+CPHry1D7KyK+
	/Wq7SrlmJhbrrnwrHsH+yAYsHHnAUo//U6orKs8xkVro0/nbKK7qwrBAPyytH/Q1
	rwXx0O7nEH/PuCcZXastnf5jwxYlhLo8VuwB+TD6rtwzfx8oINGwQpPi7goZTR/p
	5588ryxci1NWoZz6D0C1/nQ/eAeJ0YkuCWySf6ogCe4brNMNucKafcmQ6ancKnwd
	O+tTfpt94MvFNq2G/C0DAYz8Qv7mne4Tx1xmICX+H3ikd7FCJigAfAu3G8CE2odU
	v1PkNw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3fe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso4262707eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467351; x=1796072151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=FiXuGchydlJAO9RDU/V+fOHAIHc61fvyDp36lEe5htwztFldq1hDKyr0XOp48QriA2
         R5se3nz5xTU9DcR1yRAHvB/QZhEtwez2wS6AsWV7crZBLTvN2NZ8UBDqugKLaPkfV29n
         tVKvo3dMKafCw0cOPtYoiYiYX1oE4CxXQoM4dT9KJLz3WF9dcRne7fRykTQ2zRmiyqGG
         u0jxMJarsli2pkc4i/MUOGEDuyv3YXJNfNROFZqDH8RU7tBmAlWFxHQw3QCc6/Mmajvl
         pTe2t/+DJTg8vOMkXdzQDsp8I2CJSC3A9kGCyd6LpZXECmAVNkZodxAOYUbPJcJK76pZ
         0NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467351; x=1796072151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=tJITZ1M40mpK/8QhRf6DNCiEre8/kfylp4UT/QtFpAv6paqSqacRekxX+hHiV/q0bN
         Yv0cIU83U3qgt2xcF7n9XCTX1UT4OGNYy6CnCpzGXxHwnv2aYXNGNXjnxw2mV9javolC
         SBbZ3VgmTcsdBDobnIBnkZaiFwr0WpBpQsH1B3pIlyeuqmrM5Mmj9EtDYANynyWrwoFF
         sKiKIQmYD0lsmjiqV+vXesiRoqlMZ68X8AF+pEYuZXWmvzKm0/QjX7pRXm7tqiGikRvG
         xcOTLE7eHdixHYO+QVTBjToJZ6ro9ZwoarvabWCJtcQOm7Ol9VTK3YIxq8gr9dctJGiL
         dkzA==
X-Forwarded-Encrypted: i=1; AL+hErEMiYBe4TZVZIBhJiLcnhX4YDJNOT4MKBzbKqZNwD+VnnVhJB4C0vDBd8+d1qHufroZCu82qE3Vgwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cZYknQV6LnaRychObo9rqLtFDqJY0A/N4RQka+VBlIbSKot9P
	J/4MsaGw3gsKjkzgSBVMDeq8utTb4/DXyRdSB3j5wFLXddlBaJf4IJmvp3f9gKk4YZoZHstztl4
	C5rDsa9Zv2yrxg2r4RTnkw2pgy2ZWJWRPIDOfV8wLIEptkqOlMdaRtvTBD/jBObQ=
X-Gm-Gg: AZFdTZchgTWX46Su/PJ/xb+MTFfCxeWwMcz7c5Cx4VlRoWnyteC4+F16mHfrQ1bHlbM
	8HxnliSzYucartIXB89gqvoqUWOF06KrJt1nhZvUccc3jvakVTRDeqvSZ634+LZY5t8YeRCX8EG
	H/5SPdcYWx2+4Ml9mp1wx0gyIAQl51kMgIexcuzM9d+7HAQDeT7qw7JrwoTqxnHwzWMGN0ZmmJt
	KWCoWMEhUmZQnTF4h67zFzlTAjW7CMTIVBpkY/Q32KmIKtoyYS8lGB3HTUtHQJoL7z5IOQmGKWg
	hwYv0QYNxx4qZvmTHzdd6FD74JN+uz+TBeRwMMurTQ4obdOshN6DP2dl6FlLyY6FDo9GZyz5LAd
	B6mCTGpgrLZHQvu05jcxmO2UKjeqAgTK14xXJ7jAW995ih+SMQJrlCWOr+wWfwiOklN3zaXNl9s
	0P5B6y6SU9
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555353eec.2.1795467350704;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555309eec.2.1795467350116;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:49 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:47 +0530
Subject: [PATCH v5 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-bcl-hwmon-v5-7-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1207;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4gGZ4kBU9Ca0wJlDsLv1nEPxLz+5jyLqksSuJ+sGbGc=;
 b=RBVFLuG5HbWKUBG5b/9FUOJu/oqCo1UJjR508Mn6KfkxgGlMz8FiV3zsD0z5Rvk+e+mKhHNt+
 WlwErK0s24kCiiizyVJ3IlLxn8qznWUq+p/iymZiRvTfsMAQRtch8uZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: GJDiPwmmk2H_Frzuo9AyeZ7UqCqJElfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0x6B1H6QJDSn
 swqXzW9uFbMe/GcmOeZcFIespERZi3g58fBfYHsRKJiVq8r7dTkYsVuO1DiYskUByPHdxDOSSOV
 P5ary+M5Gmd00yBe/tmE8lscRyNT/XnmNaQKHWzAkGAwSm8xnnejgiTpSMGRSJZAAmQ0vsrkiOO
 rDNwFwO7G2VjIRD+F9hLSQx342Z7E3u9HbtA39jUxYDF+qeBcLM3HW6BW6TD5R4bso0EqVl/8GU
 74ggUaw1UUoWW4Y0svjNBU5SVl/RJHWq10uIECvPFKDCvLKIzoc2xAp3+feLFnNAjmiQNNwNkSs
 n7ovVxmVxM5VmYbZdlZynxmL+QxPKGxoy+AkZcYPU++GKl85dElkx24xINZVS6dyBnJj3ncjzfe
 IKimp3L5wfvPv2wW16fit6LS5LTwkmciz2VreqA0ZIddewlYzmzpV5lW85aLuter4F77RIxLeJc
 B33l03zDA3buBOcFrkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXzvjLiRROEBix
 kKdeu6JirtsTuUB00/UG9sXvG8DnGSYUSo+V2h9kH0TnHrH2gQSckfRf16wMZjJi/rKXX7BZQA/
 LnToBrGhM9kPhI5Dyh/fWxuBaI2mtGE=
X-Proofpoint-GUID: GJDiPwmmk2H_Frzuo9AyeZ7UqCqJElfa
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a857 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

